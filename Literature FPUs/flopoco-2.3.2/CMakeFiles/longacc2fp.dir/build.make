# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2"

# Include any dependencies generated for this target.
include CMakeFiles/longacc2fp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/longacc2fp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/longacc2fp.dir/flags.make

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o: CMakeFiles/longacc2fp.dir/flags.make
CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o: src/Tools/longacc2fp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o -c "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/Tools/longacc2fp.cpp"

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/Tools/longacc2fp.cpp" > CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.i

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/Tools/longacc2fp.cpp" -o CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.s

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.requires:

.PHONY : CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.requires

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.provides: CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.requires
	$(MAKE) -f CMakeFiles/longacc2fp.dir/build.make CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.provides.build
.PHONY : CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.provides

CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.provides.build: CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o


CMakeFiles/longacc2fp.dir/src/utils.o: CMakeFiles/longacc2fp.dir/flags.make
CMakeFiles/longacc2fp.dir/src/utils.o: src/utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/longacc2fp.dir/src/utils.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/longacc2fp.dir/src/utils.o -c "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/utils.cpp"

CMakeFiles/longacc2fp.dir/src/utils.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/longacc2fp.dir/src/utils.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/utils.cpp" > CMakeFiles/longacc2fp.dir/src/utils.i

CMakeFiles/longacc2fp.dir/src/utils.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/longacc2fp.dir/src/utils.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/src/utils.cpp" -o CMakeFiles/longacc2fp.dir/src/utils.s

CMakeFiles/longacc2fp.dir/src/utils.o.requires:

.PHONY : CMakeFiles/longacc2fp.dir/src/utils.o.requires

CMakeFiles/longacc2fp.dir/src/utils.o.provides: CMakeFiles/longacc2fp.dir/src/utils.o.requires
	$(MAKE) -f CMakeFiles/longacc2fp.dir/build.make CMakeFiles/longacc2fp.dir/src/utils.o.provides.build
.PHONY : CMakeFiles/longacc2fp.dir/src/utils.o.provides

CMakeFiles/longacc2fp.dir/src/utils.o.provides.build: CMakeFiles/longacc2fp.dir/src/utils.o


# Object files for target longacc2fp
longacc2fp_OBJECTS = \
"CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o" \
"CMakeFiles/longacc2fp.dir/src/utils.o"

# External object files for target longacc2fp
longacc2fp_EXTERNAL_OBJECTS =

longacc2fp: CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o
longacc2fp: CMakeFiles/longacc2fp.dir/src/utils.o
longacc2fp: CMakeFiles/longacc2fp.dir/build.make
longacc2fp: CMakeFiles/longacc2fp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable longacc2fp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/longacc2fp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/longacc2fp.dir/build: longacc2fp

.PHONY : CMakeFiles/longacc2fp.dir/build

CMakeFiles/longacc2fp.dir/requires: CMakeFiles/longacc2fp.dir/src/Tools/longacc2fp.o.requires
CMakeFiles/longacc2fp.dir/requires: CMakeFiles/longacc2fp.dir/src/utils.o.requires

.PHONY : CMakeFiles/longacc2fp.dir/requires

CMakeFiles/longacc2fp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/longacc2fp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/longacc2fp.dir/clean

CMakeFiles/longacc2fp.dir/depend:
	cd "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2" "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2" "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2" "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2" "/home/jorge/Documents/1Proyectos_TesisdeGraduacion_ASIC/Literature FPUs/flopoco-2.3.2/CMakeFiles/longacc2fp.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/longacc2fp.dir/depend
