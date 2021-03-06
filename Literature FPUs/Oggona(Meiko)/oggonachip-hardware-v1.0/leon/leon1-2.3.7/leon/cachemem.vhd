
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
-- Entity: 	cachemem
-- File:	cachemem.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Contains ram cells for both instruction and data caches
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;
use work.config.all;
use work.iface.all;
use work.macro.all;
use work.tech_map.all;

entity cachemem is
  port (
        clk   : in  clk_type;
	crami : in  cram_in_type;
	cramo : out cram_out_type
  );
end;

architecture rtl of cachemem is

  constant ITDEPTH : natural := 2**IOFFSET_BITS;
  constant DTDEPTH : natural := 2**DOFFSET_BITS;

  constant ITWIDTH : natural := ITAG_BITS;
  constant DTWIDTH : natural := DTAG_BITS;


  signal itaddr    : std_logic_vector(IOFFSET_BITS + ILINE_BITS -1 downto ILINE_BITS);
  signal idaddr    : std_logic_vector(IOFFSET_BITS + ILINE_BITS -1 downto 0);


  signal itdatain  : std_logic_vector(ITAG_BITS -1 downto 0);
  signal itdataout : std_logic_vector(ITAG_BITS -1 downto 0);
  signal iddatain  : std_logic_vector(32 -1 downto 0);
  signal iddataout : std_logic_vector(32 -1 downto 0);

  signal itenable  : std_logic;
  signal idenable  : std_logic;
  signal itwrite   : std_logic;
  signal idwrite   : std_logic;

  signal dtaddr    : std_logic_vector(DOFFSET_BITS + DLINE_BITS -1 downto DLINE_BITS);
  signal ddaddr    : std_logic_vector(DOFFSET_BITS + DLINE_BITS -1 downto 0);

  signal dtdatain  : std_logic_vector(DTAG_BITS -1 downto 0);
  signal dtdataout : std_logic_vector(DTAG_BITS -1 downto 0);
  signal dddatain  : std_logic_vector(32 -1 downto 0);
  signal dddataout : std_logic_vector(32 -1 downto 0);

  signal dtenable  : std_logic;
  signal ddenable  : std_logic;
  signal dtwrite   : std_logic;
  signal ddwrite   : std_logic;

  signal vcc, gnd  : std_logic;

begin

  vcc <= '1'; gnd <= '0';
  itaddr <= crami.icramin.idramin.address(IOFFSET_BITS + ILINE_BITS -1 downto ILINE_BITS);
  idaddr <= crami.icramin.idramin.address;


  itinsel : process(crami)
  begin


    itdatain(ITAG_BITS - 1 downto 0) <= crami.icramin.itramin.tag &
	    crami.icramin.itramin.valid;
    iddatain(31 downto 0) <= crami.icramin.idramin.data;


    dtdatain(DTAG_BITS - 1 downto 0) <= crami.dcramin.dtramin.tag &
	    crami.dcramin.dtramin.valid;
    dddatain(32 - 1 downto 0) <= crami.dcramin.ddramin.data;

  end process;

  itwrite   <= crami.icramin.itramin.write;
  idwrite   <= crami.icramin.idramin.write;
  itenable  <= crami.icramin.itramin.enable;
  idenable  <= crami.icramin.idramin.enable;

  dtaddr <= crami.dcramin.ddramin.address(DOFFSET_BITS + DLINE_BITS -1 downto DLINE_BITS);
  ddaddr <= crami.dcramin.ddramin.address;
  dtwrite   <= crami.dcramin.dtramin.write;
  ddwrite   <= crami.dcramin.ddramin.write;
  dtenable  <= crami.dcramin.dtramin.enable;
  ddenable  <= crami.dcramin.ddramin.enable;


  itags0 : syncram

      generic map ( dbits => ITAG_BITS, abits => IOFFSET_BITS)

      port map ( itaddr, clk, itdatain, itdataout, itenable, itwrite);

  dtags0 : syncram

      generic map ( dbits => DTAG_BITS, abits => DOFFSET_BITS)

      port map ( dtaddr, clk, dtdatain, dtdataout, dtenable, dtwrite);

  idata0 : syncram

      generic map ( dbits => 32, abits => IOFFSET_BITS+ILINE_BITS)

      port map ( idaddr, clk, iddatain, iddataout, idenable, idwrite);

  ddata0 : syncram

     generic map ( dbits => 32, abits => DOFFSET_BITS+DLINE_BITS)

      port map ( ddaddr, clk, dddatain, dddataout, ddenable, ddwrite);


  cramo.icramout.itramout.valid <= itdataout(ILINE_SIZE -1 downto 0);
  cramo.icramout.itramout.tag <= itdataout(ITAG_BITS-1 downto ILINE_SIZE);

  cramo.icramout.idramout.data <= iddataout(31 downto 0);

  cramo.dcramout.dtramout.valid <= dtdataout(DLINE_SIZE -1 downto 0);
  cramo.dcramout.dtramout.tag <= dtdataout(DTAG_BITS-1 downto DLINE_SIZE);

  cramo.dcramout.ddramout.data <= dddataout(31 downto 0);

end ;

