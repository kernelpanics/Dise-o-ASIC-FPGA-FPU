
----------------------------------------------------------------------------
--  This file is a part of the LEON VHDL model
--  Copyright (C) 1999  European Space Agency (ESA)
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2 of the License, or (at your option) any later version.
--
--  See the file COPYING.LGPL for the full details of the license.


-----------------------------------------------------------------------------
-- Entity: 	mctrl
-- File:	mctrl.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	External memory controller.
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."+";
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_unsigned.conv_integer;
use IEEE.std_logic_arith.conv_unsigned;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.sparcv8.all;
use work.macro.all;
use work.tech_map.all;
use work.amba.all;

entity mctrl is
  port (
    rst    : in  rst_type;
    clk    : in  clk_type;
    memi   : in  memory_in_type;
    memo   : out memory_out_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    pioo   : in  pio_out_type;
    wpo    : in  wprot_out_type;
    mctrlo : out mctrl_out_type
  );
end; 

architecture rtl of mctrl is


type areatype is (rom, io, ram);
type memcycletype is (idle, berr, bread, bwrite, bread8, bwrite8, bread16, bwrite16);


-- memory configuration register 1 type

type mcfg1type is record
  romrws           : std_logic_vector(3 downto 0);
  romwws           : std_logic_vector(3 downto 0);
  romwidth         : std_logic_vector(1 downto 0);
  romwrite         : std_logic;

  extlatch         : std_logic;
  ioen             : std_logic;
  iows             : std_logic_vector(3 downto 0);
  bexcen           : std_logic;
  brdyen           : std_logic;
  iowidth          : std_logic_vector(1 downto 0);
end record;

-- memory configuration register 2 type

type mcfg2type is record
  ramrws           : std_logic_vector(1 downto 0);
  ramwws           : std_logic_vector(1 downto 0);
  ramwidth         : std_logic_vector(1 downto 0);
  rambanksz        : std_logic_vector(3 downto 0);
  rmw              : std_logic;
end record;

-- memory status register type



-- local registers

type reg_type is record
  address          : std_logic_vector(31 downto 0);  -- memory address
  data             : std_logic_vector(31 downto 0);  -- latched memory data
  writedata        : std_logic_vector(31 downto 0);
  writedata8       : std_logic_vector(15 downto 0);  -- lsb write data buffer
  readdata         : std_logic_vector(31 downto 0);
  brdyn            : std_logic;
  ready            : std_logic;
  ready8           : std_logic;
  wren             : std_logic;
  bdrive           : std_logic_vector(3 downto 0);
  ws               : std_logic_vector(3 downto 0);
  romsn		   : std_logic_vector(1 downto 0);
  ramsn		   : std_logic_vector(3 downto 0);
  ramoen	   : std_logic_vector(3 downto 0);
  size		   : std_logic_vector(1 downto 0);
  busw		   : std_logic_vector(1 downto 0);
  psel		   : std_logic_vector(1 downto 0);
  oen              : std_logic;
  iosn		   : std_logic_vector(1 downto 0);
  read             : std_logic;
  wrn              : std_logic_vector(3 downto 0);
  writen           : std_logic;
  bstate           : memcycletype;
  area  	   : areatype;
  mcfg1		   : mcfg1type;
  mcfg2		   : mcfg2type;
  bexcn            : std_logic;		-- latched external bexcn
  echeck           : std_logic;
  rmw              : std_logic;
  brmw             : std_logic;

  hsel             : std_logic;
  hwrite           : std_logic;
  hburst           : std_logic_vector(2 downto 0);
  htrans           : std_logic_vector(1 downto 0);
  hresp 	   : std_logic_vector(1 downto 0);
end record;


signal r, ri : reg_type;
signal wrnout : std_logic_vector(3 downto 0);
signal promdata : std_logic_vector(31 downto 0); -- data from boot-prom

begin

  ctrl : process(rst, ahbsi, apbi, memi, r, pioo, promdata, wpo

		)
  variable v : reg_type;		-- local variables for registers
  variable start : std_logic;
  variable dataout : std_logic_vector(31 downto 0); -- data from memory
  variable regsd : std_logic_vector(31 downto 0);   -- data from registers
  variable memdata : std_logic_vector(31 downto 0);   -- data to memory
  variable rws : std_logic_vector(3 downto 0);		-- read waitstates
  variable wws : std_logic_vector(3 downto 0);		-- write waitstates
  variable wsnew : std_logic_vector(3 downto 0);		-- write waitstates
  variable adec : std_logic_vector(1 downto 0);
  variable rams : std_logic_vector(3 downto 0);
  variable bready, leadin : std_logic;
  variable csen : std_logic;			-- Generate chip selects
  variable aprot   : std_logic_vector(14 downto 0); -- 
  variable wrn   : std_logic_vector(3 downto 0); -- 
  variable bexc, addrerr : std_logic;
  variable ready : std_logic;
  variable writedata : std_logic_vector(31 downto 0);
  variable bwdata : std_logic_vector(31 downto 0);
  variable merrtype  : std_logic_vector(2 downto 0); -- memory error type
  variable noerror : std_logic;
  variable area  : areatype;
  variable bdrive, ramsn : std_logic_vector(3 downto 0);
  variable romsn, busw : std_logic_vector(1 downto 0);
  variable iosn : std_logic;
  variable lock : std_logic;
  variable wprothitx : std_logic;
  variable brmw : std_logic;
  variable bpsel : std_logic;
  variable psel : std_logic;

  begin

-- Variable default settings to avoid latches

    v := r; wprothitx := '0'; v.ready8 := '0'; v.iosn(0) := r.iosn(1);

    ready := '0'; addrerr := '0'; regsd := (others => '0'); csen := '0';

    v.ready := '0'; v.wren := '0';  v.echeck := '0'; bpsel := '0';
    v.rmw := '0'; merrtype := "---"; bready := '1';

    v.data := memi.data; v.bexcn := memi.bexcn; v.brdyn := memi.brdyn;
    if (((not r.brdyn) or not r.mcfg1.brdyen) = '1') or (r.area /= io) then
      bready := '1';
    else bready := '0'; end if;

    v.hresp := HRESP_OKAY;



-- decode memory area parameters

    case ahbsi.haddr(30 downto 28) is
    when "000" | "001" => area := rom;
    when "010" | "011" => area := io;
    when others => area := ram;
    end case;

    leadin := '0'; rws := "----"; wws := "----"; adec := "--";
    busw := (others => '-'); brmw := '0';
    case area is
    when rom => 

      busw := r.mcfg1.romwidth;
    when ram => 
      adec := genmux(r.mcfg2.rambanksz, ahbsi.haddr(29 downto 14)) &
              genmux(r.mcfg2.rambanksz, ahbsi.haddr(28 downto 13));
      busw := r.mcfg2.ramwidth;
      if ((r.mcfg2.rmw and ahbsi.hwrite) = '1') and 
	 ((BUS16EN and (busw = "01") and (ahbsi.hsize(1 downto 0) = "00")) or
	  ((busw(1) = '1') and (ahbsi.hsize(1) = '0'))

        )
      then brmw := '1'; end if;	 -- do a read-modify-write cycle
    when io =>
      leadin := '1';
      busw := r.mcfg1.iowidth;
    when others =>
    end case;

-- decode waitstates and illegal access

    case r.area is
    when rom =>
      rws := r.mcfg1.romrws; wws := r.mcfg1.romwws;
      if (r.mcfg1.romwrite or r.read) = '0' then addrerr := '1'; end if;
    when ram =>
      rws := "00" & r.mcfg2.ramrws; wws := "00" & r.mcfg2.ramwws;
    when io =>
      rws := r.mcfg1.iows; wws := r.mcfg1.iows;
      if r.mcfg1.ioen = '0' then addrerr := '1'; end if;
    when others => null;
    end case;

-- generate data buffer enables

    bdrive := (others => '1');
    case r.busw is
    when "00" => if BUS8EN then bdrive := "0001"; end if;
    when "01" => if BUS16EN then bdrive := "0011"; end if;
    when others =>
    end case;

-- generate chip select and output enable

    rams := decode(adec);

    iosn := '1'; ramsn := (others => '1'); romsn := (others => '1');
    psel := '1'; v.psel(1) := r.psel(0);
    case area is
    when rom => 
      if ((BOOTOPT = memory) or ((BOOTOPT = dual) and (pioo.io8lsb(4) = '0'))) then
	romsn(0) := ahbsi.haddr(28); 
      else psel := ahbsi.haddr(28); end if;
      romsn(1) := not ahbsi.haddr(28);
    when ram => ramsn := not rams;
    when io => iosn := '0'; 
    when others => null;
    end case;

-- generate write strobe

    wrn := "0000";
    case r.busw is
    when "00" => 
      if BUS8EN then wrn := "1110"; end if;
    when "01" => 
      if BUS16EN then
	if (r.size = "00") and (r.brmw = '0') then
	  wrn := "11" & (not r.address(0)) & r.address(0);
        else wrn := "1100"; end if;
      end if;
    when "10" | "11" =>
      case r.size is
      when "00" => 
        case r.address(1 downto 0) is
        when "00" => wrn := "1110";
        when "01" => wrn := "1101";
        when "10" => wrn := "1011";
        when others => wrn := "0111";
        end case;
      when "01" => 
        wrn := not r.address(1) & not r.address(1) & r.address(1) & r.address(1);
      when others => null;
      end case;
    when others => null;
    end case;

    if (r.mcfg2.rmw = '1') and (r.area = ram) then wrn := not bdrive; end if;

    if ((ahbsi.hready and ahbsi.hsel) = '1') then
      v.size := ahbsi.hsize(1 downto 0); v.area := area;
      v.hburst := ahbsi.hburst; v.htrans := ahbsi.htrans;
      v.address  := ahbsi.haddr; v.psel(0) := psel;
      if (busw = "00") and (ahbsi.hwrite = '0') and (area /= io) and BUS8EN
      then v.address(1 downto 0) := "00"; end if;
      if (busw = "01") and (ahbsi.hwrite = '0') and (area /= io) and BUS16EN
      then v.address(1 downto 0) := "00"; end if;
      if (brmw = '1') then 
	v.read := '1'; 

      else v.read := not ahbsi.hwrite; end if;
      v.hwrite := ahbsi.hwrite;
      v.busw := busw; v.brmw := brmw;

    end if;

-- Select read data depending on bus width

    if BUS8EN and (r.busw = "00") then 
      memdata := r.readdata(23 downto 0) & r.data(31 downto 24);
    elsif BUS16EN and (r.busw = "01") then 
      memdata := r.readdata(15 downto 0) & r.data(31 downto 16);
    else 
      memdata := r.data;
    end if;
    bwdata := memdata;


-- Merge data during byte write

    writedata := ahbsi.hwdata;
    if ((r.brmw and r.busw(1)) = '1')

    then
      case r.address(1 downto 0) is

      when "00" => 
	writedata(15 downto 0) := bwdata(15 downto 0);
	if r.size = "00" then 
	  writedata(23 downto 16) := bwdata(23 downto 16);
	end if;
      when "01" => 
	writedata(31 downto 24) := bwdata(31 downto 24);
	writedata(15 downto 0) := bwdata(15 downto 0);
      when "10" => 
	writedata(31 downto 16) := bwdata(31 downto 16);
	if r.size = "00" then 
	  writedata(7 downto 0) := bwdata(7 downto 0);
	end if;
      when  others => 
	writedata(31 downto 8) := bwdata(31 downto 8);
      end case;
    end if;
    if (r.brmw = '1') and (r.busw = "01") and BUS16EN then
      if (r.address(0) = '0') then 
        writedata(23 downto 16) :=  r.data(23 downto 16);
      else
        writedata(31 downto 24) :=  r.data(31 downto 24);
      end if;
    end if;

-- save read data during 8/16 bit reads

    if BUS8EN and (r.ready8 = '1') and (r.busw = "00") then
      v.readdata := v.readdata(23 downto 0) & r.data(31 downto 24);
    elsif BUS16EN and (r.ready8 = '1') and (r.busw = "01") then
      v.readdata := v.readdata(15 downto 0) & r.data(31 downto 16);
    end if;

-- Ram, rom, IO access FSM

    if r.read = '1' then wsnew := rws; else wsnew := wws; end if;

    case r.bstate is
    when idle =>
      v.ws := wsnew; 
      if r.bdrive(0) = '0' then 
        if r.busw(1) = '1' then v.writedata := writedata;
	else
	  v.writedata(31 downto 16) := writedata(31 downto 16);
	  v.writedata8 := writedata(15 downto 0);
	end if;

      end if;
      if r.hsel = '1' then
	wprothitx := wpo.wprothit and not r.read;
	if (wprothitx or addrerr) = '1' then
	  v.hresp := HRESP_ERROR; v.bstate := berr;
	elsif r.read = '0' then 
	  if (r.busw = "00") and (r.area /= io) and BUS8EN then 
	    v.bstate := bwrite8;
	  elsif (r.busw = "01") and (r.area /= io) and BUS16EN then 
	    v.bstate := bwrite16;
   	  else v.bstate := bwrite; end if;
	  v.wrn := wrn; v.writen := '0'; v.bdrive := bdrive;
	else 
	  if r.oen = '1' then v.ramoen := r.ramsn; v.oen := '0';
	  else
	    if (r.busw = "00") and (r.area /= io) and BUS8EN then v.bstate := bread8;
	    elsif (r.busw = "01") and (r.area /= io) and BUS16EN then v.bstate := bread16;
	    else v.bstate := bread; end if;
	  end if;
	end if;
      end if;
    when berr =>
      v.bstate := idle; v.hsel := '0'; ready := '1';
      v.hresp := HRESP_ERROR;
      v.ramsn := (others => '1'); v.romsn := (others => '1'); v.psel(0) := '1';
      v.ramoen := (others => '1'); v.oen := '1'; v.iosn := "11";
    when bread => 
      if ((r.ws = "0000") and (r.ready = '0') and (bready = '1'))
      then 
	if r.brmw = '0' then
	  ready := '1'; v.address := ahbsi.haddr; v.echeck := '1';
	end if;
        if (((ahbsi.hsel = '0') or (ahbsi.htrans /= HTRANS_SEQ)) or (r.hburst = HBURST_SINGLE))
        then
	  if r.brmw = '0' then
  	    v.ramsn := (others => '1'); v.romsn := (others => '1'); 
	    v.hsel := '0'; v.psel(0) := '1';
	  else v.echeck := '1'; end if;
  	  v.ramoen := (others => '1'); v.oen := '1'; v.iosn := "11";
   	  v.bstate := idle; v.read := not r.hwrite;
	end if;
      end if;
      if r.ready = '1' then
	v.ws := rws;
      else
	if r.ws /= "0000" then v.ws := r.ws - 1; end if;
      end if;
    when bwrite =>
      if (r.ws = "0000") and (bready = '1') then
	ready := '1'; v.wrn := (others => '1'); v.writen := '1'; v.echeck := '1';
	v.ramsn := (others => '1'); v.romsn := (others => '1'); v.iosn := "11";
	v.bdrive := (others => '0'); v.bstate := idle; v.hsel := '0';
	v.psel(0) := '1';
      end if;
      if r.ws /= "0000" then v.ws := r.ws - 1; end if;
    when bread8 => 
      if BUS8EN then
        if (r.ws = "0000") and (r.ready8 = '0') then
	  v.ready8 := '1'; v.ws := rws; 
	  v.address(1 downto 0) := r.address(1 downto 0) + 1;

          if (r.address(1 downto 0) = "11") then
	    ready := '1'; v.address := ahbsi.haddr; v.echeck := '1';

            if (((ahbsi.hsel = '0') or (ahbsi.htrans /= HTRANS_SEQ)) or 
	        (r.hburst = HBURST_SINGLE))
            then
  	      v.ramoen := (others => '1'); v.oen := '1'; v.iosn := "11";
   	      v.bstate := idle;

  	      v.ramsn := (others => '1'); v.romsn := (others => '1'); v.hsel := '0';
	      v.psel(0) := '1';

	    end if;
          end if;
        end if;
        if (r.ready8 = '1') then v.ws := rws;
        elsif r.ws /= "0000" then v.ws := r.ws - 1; end if;
      end if;
    when bwrite8 =>
      if BUS8EN then
        if (r.ws = "0000") and (r.ready8 = '0') then 
	  v.ready8 := '1'; v.wrn := (others => '1'); v.writen := '1';
        end if;

        if (r.ws = "0000") and 
           ((r.address(1 downto 0) = "11") or 
            ((r.address(1 downto 0) = "01") and (r.size = "01")) or
	    (r.size = "00")) 

        then
	  ready := '1'; v.wrn := (others => '1'); v.writen := '1'; v.echeck := '1';
	  v.ramsn := (others => '1'); v.romsn := (others => '1'); v.iosn := "11";
	  v.bdrive := (others => '0'); v.bstate := idle; v.hsel := '0';
	  v.psel(0) := '1';

        end if;
        if (r.ready8 = '1') then
	  v.address(1 downto 0) := r.address(1 downto 0) + 1; v.ws := rws; 
--	  v.writedata(31 downto 8) := r.writedata(23 downto 0);
	  v.writedata(31 downto 16) := r.writedata(23 downto 16) & r.writedata8(15 downto 8);
	  v.writedata8(15 downto 8) := r.writedata8(7 downto 0);
	  v.bstate := idle; 

        end if;
        if r.ws /= "0000" then v.ws := r.ws - 1; end if;
      end if;
    when bread16 => 
      if BUS16EN then
        if (r.ws = "0000") and ((r.address(1) or r.brmw) = '1') and 
	   (r.ready8 = '0') 
        then
	  if r.brmw = '0' then
	    ready := '1'; v.address := ahbsi.haddr; v.echeck := '1';
	  end if;
          if (((ahbsi.hsel = '0') or (ahbsi.htrans /= HTRANS_SEQ)) or 
	      (r.hburst = HBURST_SINGLE))
          then
	    if r.brmw = '0' then
  	      v.ramsn := (others => '1'); v.romsn := (others => '1'); v.hsel := '0';
	      v.psel(0) := '1';
	    end if;
  	    v.ramoen := (others => '1'); v.oen := '1'; v.iosn := "11";
   	    v.bstate := idle; v.read := not r.hwrite;
	  end if;
        end if;
        if (r.ws = "0000") and (r.ready8 = '0') then 
	  v.ready8 := '1'; v.ws := rws; 
	  if r.brmw = '0' then v.address(1) := not r.address(1); end if;
        end if;
        if r.ws /= "0000" then v.ws := r.ws - 1; end if;
      end if;
    when bwrite16 =>
      if BUS16EN then
        if (r.ws = "0000") and 
           ((r.address(1 downto 0) = "10") or (r.size(1) = '0')) 
        then
	  ready := '1'; v.wrn := (others => '1'); v.writen := '1'; v.echeck := '1';
	  v.ramsn := (others => '1'); v.romsn := (others => '1'); v.iosn := "11";
	  v.bdrive := (others => '0'); v.bstate := idle; v.hsel := '0';
	  v.psel(0) := '1';
        end if;
        if (r.ws = "0000") and (r.ready8 = '0') then 
	  v.ready8 := '1'; v.wrn := (others => '1'); v.writen := '1';
        end if;
        if (r.ready8 = '1') then
	  v.address(1) := not r.address(1); v.ws := rws; 
	  v.writedata(31 downto 16) := r.writedata8(15 downto 0);
	  v.bstate := idle; 
        end if;
        if r.ws /= "0000" then v.ws := r.ws - 1; end if;
      end if;
    when others =>
    end case;

-- if BUSY or IDLE cycle seen, or if de-selected, return to idle state
    if (ahbsi.hready = '1') then
      if ((ahbsi.hsel = '0') or (ahbsi.htrans = HTRANS_BUSY) or 
	(ahbsi.htrans = HTRANS_IDLE))
      then
        v.bstate := idle;
        v.ramsn := (others => '1'); v.romsn := (others => '1');
        v.ramoen := (others => '1'); v.oen := '1'; v.iosn := "11";
        v.bdrive := (others => '0'); v.wrn := (others => '1');
        v.writen := '1'; v.hsel := '0'; ready := ahbsi.hsel;
	v.psel(0) := '1';
      elsif ahbsi.hsel = '1' then
        v.romsn := romsn; v.ramsn := ramsn; v.iosn := iosn & '1'; v.hsel := '1';
        v.psel(0) := psel;
        if v.read = '1' then v.ramoen := ramsn; v.oen := leadin; end if;
      end if;
    end if;

-- error checking and reporting

    noerror := '1';
    if ((r.echeck and r.mcfg1.bexcen and not r.bexcn) = '1') then
      noerror := '0'; v.bstate := berr; v.hresp := HRESP_ERROR;
    end if;

-- APB register access

    case apbi.paddr(3 downto 2) is
    when "00" => 
      regsd(28 downto 0) := r.mcfg1.iowidth & 
	r.mcfg1.brdyen & r.mcfg1.bexcen & "0" & r.mcfg1.iows & r.mcfg1.ioen &
	r.mcfg1.extlatch & 

	"000000" & r.mcfg1.romwrite & 

	'0' & r.mcfg1.romwidth & r.mcfg1.romwws & r.mcfg1.romrws;
    when "01" => 
      regsd(12 downto 0) := r.mcfg2.rambanksz & "00" & r.mcfg2.rmw &
	r.mcfg2.ramwidth & r.mcfg2.ramwws & r.mcfg2.ramrws;

    when others => regsd := (others => '0');
    end case;

    apbo.prdata <= regsd;

    if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(5 downto 2) is
      when "0000" => 
        v.mcfg1.romrws      :=  apbi.pwdata(3 downto 0); 
        v.mcfg1.romwws      :=  apbi.pwdata(7 downto 4);
        v.mcfg1.romwidth    :=  apbi.pwdata(9 downto 8);
        v.mcfg1.romwrite    :=  apbi.pwdata(11);

        v.mcfg1.extlatch    :=  apbi.pwdata(18);
        v.mcfg1.ioen        :=  apbi.pwdata(19);
        v.mcfg1.iows        :=  apbi.pwdata(23 downto 20);
        v.mcfg1.bexcen      :=  apbi.pwdata(25);
        v.mcfg1.brdyen      :=  apbi.pwdata(26);
        v.mcfg1.iowidth     :=  apbi.pwdata(28 downto 27);
      when "0001" => 
        v.mcfg2.ramrws      := apbi.pwdata(1 downto 0);
        v.mcfg2.ramwws      := apbi.pwdata(3 downto 2);
        v.mcfg2.ramwidth    := apbi.pwdata(5 downto 4);
        v.mcfg2.rmw         := apbi.pwdata(6);
        v.mcfg2.rambanksz   := apbi.pwdata(12 downto 9);

      when others => null;
      end case;
    end if;

-- select appropriate data during reads

    case r.area is
    when rom | ram => 
      dataout := memdata;
      if (r.area = rom) and (BOOTOPT /= memory) then
	if (r.psel(0) = '0') then v.readdata := promdata; end if;
        if r.psel(1) = '0' then dataout := r.readdata; end if;
      end if;
    when others =>
      if BUS8EN and (r.busw = "00") then
        dataout := r.data(31 downto 24) & r.data(31 downto 24) 
		 & r.data(31 downto 24) & r.data(31 downto 24);
      elsif BUS16EN and (r.busw = "01") then
        dataout := r.data(31 downto 16) & r.data(31 downto 16); 
      else dataout := r.data; end if;
    end case;


    v.ready := ready;

-- generate memory address

    if RAWADDR and (r.mcfg1.extlatch = '1') then
      memo.address <= v.address(27 downto 0);
    else
      memo.address <= r.address(27 downto 0);
    end if;

-- use d(15:0) as I/O ports (only usefull in 8/16-bit mode)

    if BUS8EN or BUS16EN then 
      mctrlo.pioh <= r.data(15 downto 0);
      if (r.mcfg1.romwidth(1) or r.mcfg1.iowidth(1) or r.mcfg2.ramwidth(1)) = '0' then
        v.writedata(15 downto 0) := r.writedata(15 downto 0);
        if pioo.wrio = '1' then 
	  v.writedata(15 downto 0) := pioo.piol(31 downto 16);
        end if;
        v.wrn(3 downto 2) := "11";
	v.bdrive(3 downto 2) := not pioo.piodir(17 downto 16);
      end if;
    else mctrlo.pioh <= (others => '0'); end if;

-- reset

    if rst.syncrst = '0' then

      v.bstate 	 	   := idle; 
      v.read 		   := '1'; 
      v.wrn                := "1111";
      v.writen		   := '1'; 
      v.mcfg1.romwrite     := '0';
      v.mcfg1.extlatch     := '0';
      v.mcfg1.ioen         := '0';
      v.mcfg1.brdyen       := '0';
      v.mcfg1.bexcen       := '0';
      v.hsel		   := '0';
      if ((BOOTOPT = memory) or ((BOOTOPT = dual) and (pioo.io8lsb(4) = '0'))) 
      then
        v.mcfg1.romrws     := "1111";
        v.mcfg1.romwws     := "1111";
        v.mcfg1.romwidth   := pioo.io8lsb(1 downto 0);
      else
	v.mcfg2.ramrws	   := std_logic_vector(BRAMRWS(1 downto 0));
	v.mcfg2.ramwws	   := std_logic_vector(BRAMWWS(1 downto 0));
        v.mcfg1.romrws     := "0001";
        v.mcfg1.romwws     := "0001";
        v.mcfg1.romwidth   := "11";
      end if;
    end if;

-- pragma translate_off
    for i in dataout'range loop --'
      if is_x(dataout(i)) then dataout(i) := '1'; end if;
    end loop;
-- pragma translate_on

-- drive various register inputs and external outputs

    ri <= v; 

    memo.ramsn    	<= r.ramsn;
    memo.ramoen     	<= r.ramoen;
    memo.romsn       	<= r.romsn;
    memo.oen  		<= r.oen;
    memo.iosn  		<= r.iosn(0);
    memo.read  		<= r.read;
    memo.wrn 		<= r.wrn; 
    memo.writen 	<= r.writen;
    memo.bdrive  	<= (not r.bdrive) and memi.wrn;
    memo.data		<= r.writedata;


    ahbso.hrdata <= dataout;
    ahbso.hready <= r.ready and noerror;
    ahbso.hresp  <= r.hresp;
    ahbso.hsplit <= (others => '0');

  end process;


  stdregs : process(clk,rst)
  begin 
    if rising_edge(clk) then r <= ri; end if;
    if rst.rawrst = '0' then
      r.ramsn <= (others => '1'); r.romsn <= (others => '1');
      r.oen <= '1'; r.bdrive <= (others => '0');
      r.iosn <= "11"; r.ramoen <= (others => '1');
    end if;
  end process;



-- optional boot-prom
 promgen : if (BOOTOPT /= memory) generate
    bprom0 : bprom port map

      (clk => clk, cs => r.psel(0), addr => r.address, data => promdata);

  end generate;

end;

