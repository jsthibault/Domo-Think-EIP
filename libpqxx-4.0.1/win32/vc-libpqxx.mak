################################################################################r
# AUTOMATICALLY GENERATED FILE--DO NOT EDITr
#r
# This file is generated automatically by libpqxx's template2mak.py script.r
#r
# If you modify this file, chances are your modifications will be lost becauser
# the file will be re-written from time to time.r
#r
# The template2mak.py script should be available in the tools directory of ther
# libpqxx source archive.r
#r
# Generated from template '/Users/mowgli/cpp/libpqxx-4.0.1/win32/vc-libpqxx.mak.template'.r
################################################################################r
# Visual C++ makefile for libpqxxr
# This file was created by Bart Samwel.r
r
default:r
	@echo LIBPQXX Makefile for Visual C++ Available Targetsr
	@echo -------------------------------------------------r
	@echo.r
	@echo Static library targets:r
	@echo.r
	@echo STATICr
	@echo STATICRELEASE (release mode only)r
	@echo STATICDEBUG (debug mode only)r
	@echo.r
	@echo Dynamic Link Library (DLL) targets:r
	@echo.r
	@echo DLLr
	@echo DLLRELEASEr
	@echo DLLDEBUGr
	@echo.r
	@echo Other targets:r
	@echo.r
	@echo ALL: build both the DLL and STATIC builds.r
	@echo CLEAN: clean up all output.r
	@echo.r
	@echo It is recommended that you link to libpqxx statically. Therefore, you shouldr
	@echo normally build the "STATIC" target. If you want to link your programto libpqxxr
	@echo dynamically, build target "DLL" and compile your program with preprocessorr
	@echo define "PQXX_SHARED". This will make your program link against the DLL versionr
	@echo of libpqxx.r
r
!IF "$(OS)" == "Windows_NT"r
NULL=r
!ELSEr
NULL=nulr
!ENDIFr
r
!include win32/commonr
r
r
r
########################################################r
# Configurationr
########################################################r
r
r
r
# Output DLL/LIB files. No extensions, they are added automatically!r
OUTDIR=libr
OUTFILE_STATICDEBUG=$(OUTDIR)\libpqxx_staticDr
OUTFILE_STATICRELEASE=$(OUTDIR)\libpqxx_staticr
OUTFILE_DLLDEBUG=$(OUTDIR)\libpqxxDr
OUTFILE_DLLRELEASE=$(OUTDIR)\libpqxxr
r
# Directories for intermediate output.r
INTDIR_STATICDEBUG=ObjStaticDebugr
INTDIR_STATICRELEASE=ObjStaticReleaser
INTDIR_DLLDEBUG=ObjDllDebugr
INTDIR_DLLRELEASE=ObjDllReleaser
r
# C++ compiler, linker (for DLLs) and library tool (for static builds).r
CXX=cl.exer
LINK=link.exer
LIBTOOL=link.exe -libr
r
# The options common to all the different builds.r
CXX_FLAGS_BASE=/nologo /W3 /EHsc /FD /GR /c \r
    /I "include" /I $(PGSQLINC) /I $(LIBPQINC) \r
    /D PGSTD=$(STD) /D "WIN32" /D "_MBCS" /D "_WINDOWS" /D "PQXX_INTERNAL"r
r
CXX_FLAGS_DLLRELEASE=$(CXX_FLAGS_BASE) /MD  /D "NDEBUG" /D "PQXX_SHARED"r
CXX_FLAGS_DLLDEBUG=$(CXX_FLAGS_BASE) /MDd /Gm /ZI /Od /D "_DEBUG" /D "PQXX_SHARED" /RTC1r
CXX_FLAGS_STATICRELEASE=$(CXX_FLAGS_BASE) /MD /D "_LIB" /D "NDEBUG"r
CXX_FLAGS_STATICDEBUG=$(CXX_FLAGS_BASE) /MDd /Gm /ZI /Od /D "_LIB" /D "_DEBUG" /RTC1r
r
LINK_FLAGS_BASE=kernel32.lib ws2_32.lib advapi32.lib /nologo /dll /machine:I386 shell32.lib secur32.lib wldap32.libr
r
LINK_FLAGS_DLLRELEASE=$(LINK_FLAGS_BASE) /libpath:$(LIBPQPATH) $(LIBPQLIB)r
LINK_FLAGS_DLLDEBUG=$(LINK_FLAGS_BASE) /libpath:$(LIBPQDPATH) $(LIBPQDLIB) /debugr
r
LIB_FLAGS=/nologor
r
r
r
########################################################r
# List of intermediate filesr
########################################################r
r
OBJ_STATICDEBUG=\r
       "$(INTDIR_STATICDEBUG)\binarystring.obj" \r
       "$(INTDIR_STATICDEBUG)\connection.obj" \r
       "$(INTDIR_STATICDEBUG)\connection_base.obj" \r
       "$(INTDIR_STATICDEBUG)\cursor.obj" \r
       "$(INTDIR_STATICDEBUG)\dbtransaction.obj" \r
       "$(INTDIR_STATICDEBUG)\errorhandler.obj" \r
       "$(INTDIR_STATICDEBUG)\except.obj" \r
       "$(INTDIR_STATICDEBUG)\field.obj" \r
       "$(INTDIR_STATICDEBUG)\largeobject.obj" \r
       "$(INTDIR_STATICDEBUG)\nontransaction.obj" \r
       "$(INTDIR_STATICDEBUG)\notification.obj" \r
       "$(INTDIR_STATICDEBUG)\notify-listen.obj" \r
       "$(INTDIR_STATICDEBUG)\pipeline.obj" \r
       "$(INTDIR_STATICDEBUG)\prepared_statement.obj" \r
       "$(INTDIR_STATICDEBUG)\result.obj" \r
       "$(INTDIR_STATICDEBUG)\robusttransaction.obj" \r
       "$(INTDIR_STATICDEBUG)\statement_parameters.obj" \r
       "$(INTDIR_STATICDEBUG)\strconv.obj" \r
       "$(INTDIR_STATICDEBUG)\subtransaction.obj" \r
       "$(INTDIR_STATICDEBUG)\tablereader.obj" \r
       "$(INTDIR_STATICDEBUG)\tablestream.obj" \r
       "$(INTDIR_STATICDEBUG)\tablewriter.obj" \r
       "$(INTDIR_STATICDEBUG)\transaction.obj" \r
       "$(INTDIR_STATICDEBUG)\transaction_base.obj" \r
       "$(INTDIR_STATICDEBUG)\tuple.obj" \r
       "$(INTDIR_STATICDEBUG)\util.obj" \r
r
OBJ_STATICRELEASE=\r
       "$(INTDIR_STATICRELEASE)\binarystring.obj" \r
       "$(INTDIR_STATICRELEASE)\connection.obj" \r
       "$(INTDIR_STATICRELEASE)\connection_base.obj" \r
       "$(INTDIR_STATICRELEASE)\cursor.obj" \r
       "$(INTDIR_STATICRELEASE)\dbtransaction.obj" \r
       "$(INTDIR_STATICRELEASE)\errorhandler.obj" \r
       "$(INTDIR_STATICRELEASE)\except.obj" \r
       "$(INTDIR_STATICRELEASE)\field.obj" \r
       "$(INTDIR_STATICRELEASE)\largeobject.obj" \r
       "$(INTDIR_STATICRELEASE)\nontransaction.obj" \r
       "$(INTDIR_STATICRELEASE)\notification.obj" \r
       "$(INTDIR_STATICRELEASE)\notify-listen.obj" \r
       "$(INTDIR_STATICRELEASE)\pipeline.obj" \r
       "$(INTDIR_STATICRELEASE)\prepared_statement.obj" \r
       "$(INTDIR_STATICRELEASE)\result.obj" \r
       "$(INTDIR_STATICRELEASE)\robusttransaction.obj" \r
       "$(INTDIR_STATICRELEASE)\statement_parameters.obj" \r
       "$(INTDIR_STATICRELEASE)\strconv.obj" \r
       "$(INTDIR_STATICRELEASE)\subtransaction.obj" \r
       "$(INTDIR_STATICRELEASE)\tablereader.obj" \r
       "$(INTDIR_STATICRELEASE)\tablestream.obj" \r
       "$(INTDIR_STATICRELEASE)\tablewriter.obj" \r
       "$(INTDIR_STATICRELEASE)\transaction.obj" \r
       "$(INTDIR_STATICRELEASE)\transaction_base.obj" \r
       "$(INTDIR_STATICRELEASE)\tuple.obj" \r
       "$(INTDIR_STATICRELEASE)\util.obj" \r
r
OBJ_DLLDEBUG=\r
       "$(INTDIR_DLLDEBUG)\binarystring.obj" \r
       "$(INTDIR_DLLDEBUG)\connection.obj" \r
       "$(INTDIR_DLLDEBUG)\connection_base.obj" \r
       "$(INTDIR_DLLDEBUG)\cursor.obj" \r
       "$(INTDIR_DLLDEBUG)\dbtransaction.obj" \r
       "$(INTDIR_DLLDEBUG)\errorhandler.obj" \r
       "$(INTDIR_DLLDEBUG)\except.obj" \r
       "$(INTDIR_DLLDEBUG)\field.obj" \r
       "$(INTDIR_DLLDEBUG)\largeobject.obj" \r
       "$(INTDIR_DLLDEBUG)\nontransaction.obj" \r
       "$(INTDIR_DLLDEBUG)\notification.obj" \r
       "$(INTDIR_DLLDEBUG)\notify-listen.obj" \r
       "$(INTDIR_DLLDEBUG)\pipeline.obj" \r
       "$(INTDIR_DLLDEBUG)\prepared_statement.obj" \r
       "$(INTDIR_DLLDEBUG)\result.obj" \r
       "$(INTDIR_DLLDEBUG)\robusttransaction.obj" \r
       "$(INTDIR_DLLDEBUG)\statement_parameters.obj" \r
       "$(INTDIR_DLLDEBUG)\strconv.obj" \r
       "$(INTDIR_DLLDEBUG)\subtransaction.obj" \r
       "$(INTDIR_DLLDEBUG)\tablereader.obj" \r
       "$(INTDIR_DLLDEBUG)\tablestream.obj" \r
       "$(INTDIR_DLLDEBUG)\tablewriter.obj" \r
       "$(INTDIR_DLLDEBUG)\transaction.obj" \r
       "$(INTDIR_DLLDEBUG)\transaction_base.obj" \r
       "$(INTDIR_DLLDEBUG)\tuple.obj" \r
       "$(INTDIR_DLLDEBUG)\util.obj" \r
       "$(INTDIR_DLLDEBUG)\libpqxx.obj" \r
r
OBJ_DLLRELEASE=\r
       "$(INTDIR_DLLRELEASE)\binarystring.obj" \r
       "$(INTDIR_DLLRELEASE)\connection.obj" \r
       "$(INTDIR_DLLRELEASE)\connection_base.obj" \r
       "$(INTDIR_DLLRELEASE)\cursor.obj" \r
       "$(INTDIR_DLLRELEASE)\dbtransaction.obj" \r
       "$(INTDIR_DLLRELEASE)\errorhandler.obj" \r
       "$(INTDIR_DLLRELEASE)\except.obj" \r
       "$(INTDIR_DLLRELEASE)\field.obj" \r
       "$(INTDIR_DLLRELEASE)\largeobject.obj" \r
       "$(INTDIR_DLLRELEASE)\nontransaction.obj" \r
       "$(INTDIR_DLLRELEASE)\notification.obj" \r
       "$(INTDIR_DLLRELEASE)\notify-listen.obj" \r
       "$(INTDIR_DLLRELEASE)\pipeline.obj" \r
       "$(INTDIR_DLLRELEASE)\prepared_statement.obj" \r
       "$(INTDIR_DLLRELEASE)\result.obj" \r
       "$(INTDIR_DLLRELEASE)\robusttransaction.obj" \r
       "$(INTDIR_DLLRELEASE)\statement_parameters.obj" \r
       "$(INTDIR_DLLRELEASE)\strconv.obj" \r
       "$(INTDIR_DLLRELEASE)\subtransaction.obj" \r
       "$(INTDIR_DLLRELEASE)\tablereader.obj" \r
       "$(INTDIR_DLLRELEASE)\tablestream.obj" \r
       "$(INTDIR_DLLRELEASE)\tablewriter.obj" \r
       "$(INTDIR_DLLRELEASE)\transaction.obj" \r
       "$(INTDIR_DLLRELEASE)\transaction_base.obj" \r
       "$(INTDIR_DLLRELEASE)\tuple.obj" \r
       "$(INTDIR_DLLRELEASE)\util.obj" \r
       "$(INTDIR_DLLRELEASE)\libpqxx.obj" \r
r
r
r
########################################################r
# Logical targetsr
########################################################r
r
static: staticdebug staticreleaser
r
dll: dlldebug dllreleaser
r
all: static dllr
r
$(OUTDIR):r
	-@mkdir $(OUTDIR)r
r
staticdebug: $(OUTFILE_STATICDEBUG).lib $(OUTDIR) $(OUTDIR)\$(LIBPQDDLL) $(OUTDIR)\$(LIBPQDLIB)r
staticrelease: $(OUTFILE_STATICRELEASE).lib $(OUTDIR) $(OUTDIR)\$(LIBPQDLL) $(OUTDIR)\$(LIBPQLIB)r
r
dlldebug: $(OUTFILE_DLLDEBUG).dll $(OUTDIR) $(OUTDIR)\$(LIBPQDDLL)r
r
dllrelease: $(OUTFILE_DLLRELEASE).dll $(OUTDIR) $(OUTDIR)\$(LIBPQDLL)r
r
clean:r
	@echo Deleting all intermediate output files and the contents of $(OUTDIR).r
	-@del /Q "$(INTDIR_STATICDEBUG)\*"r
	-@del /Q "$(INTDIR_STATICRELEASE)\*"r
	-@del /Q "$(INTDIR_DLLDEBUG)\*"r
	-@del /Q "$(INTDIR_DLLRELEASE)\*"r
	-@del /Q "$(OUTDIR)\*"r
r
r
r
########################################################r
# Physical targetsr
########################################################r
r
$(OUTDIR)\$(LIBPQDLL): $(OUTDIR)r
	@echo -------------------------------------------------------------r
	@echo Copying $(LIBPQDLL) to $(OUTDIR).r
	@echo.r
	@echo IMPORTANT: you MUST copy this $(LIBPQDLL) into the directoryr
	@echo where your program's .EXE resides. The system $(LIBPQDLL) isr
	@echo not necessarily compatible with the libpq include files thatr
	@echo you built libpqxx with. Do NOT copy this file into yourr
	@echo Windows system32 directory, that may break other programs.r
	@echo Instead, keep it with your program and distribute it alongr
	@echo with the program.r
	@echo -------------------------------------------------------------r
	copy $(LIBPQPATH)\$(LIBPQDLL) $(OUTDIR)r
r
$(OUTDIR)\$(LIBPQDDLL): $(OUTDIR)r
	@echo -------------------------------------------------------------r
	@echo Copying $(LIBPQDDLL) to $(OUTDIR).r
	@echo.r
	@echo IMPORTANT: you MUST copy this $(LIBPQDDLL) into the directoryr
	@echo where your program's .EXE resides, or you must make sure thatr
	@echo it is in your system PATH.r
	@echo -------------------------------------------------------------r
	copy $(LIBPQDPATH)\$(LIBPQDDLL) $(OUTDIR)r
r
$(OUTDIR)\$(LIBPQLIB): $(OUTDIR)r
	copy $(LIBPQPATH)\$(LIBPQLIB) $(OUTDIR)r
r
$(OUTDIR)\$(LIBPQDLIB): $(OUTDIR)r
	copy $(LIBPQDPATH)\$(LIBPQDLIB) $(OUTDIR)r
r
$(OUTFILE_STATICDEBUG).lib: $(OUTDIR) $(OBJ_STATICDEBUG)r
	$(LIBTOOL) $(LIB_FLAGS) $(OBJ_STATICDEBUG) /out:"$(OUTFILE_STATICDEBUG).lib"r
r
$(OUTFILE_STATICRELEASE).lib: $(OUTDIR) $(OBJ_STATICRELEASE)r
	$(LIBTOOL) $(LIB_FLAGS) $(OBJ_STATICRELEASE) /out:"$(OUTFILE_STATICRELEASE).lib"r
r
$(OUTFILE_DLLDEBUG).dll: $(OUTDIR) $(OBJ_DLLDEBUG)r
	$(LINK) $(LINK_FLAGS_DLLDEBUG) $(OBJ_DLLDEBUG) /out:"$(OUTFILE_DLLDEBUG).dll" /implib:"$(OUTFILE_DLLDEBUG).lib"r
r
$(OUTFILE_DLLRELEASE).dll: $(OUTDIR) $(OBJ_DLLRELEASE)r
	$(LINK) $(LINK_FLAGS_DLLRELEASE) $(OBJ_DLLRELEASE) /out:"$(OUTFILE_DLLRELEASE).dll" /implib:"$(OUTFILE_DLLRELEASE).lib"r
r
r
$(INTDIR_STATICDEBUG):r
	-@mkdir $(INTDIR_STATICDEBUG)r
r
$(INTDIR_STATICRELEASE):r
	-@mkdir $(INTDIR_STATICRELEASE)r
r
$(INTDIR_DLLDEBUG):r
	-@mkdir $(INTDIR_DLLDEBUG)r
r
$(INTDIR_DLLRELEASE):r
	-@mkdir $(INTDIR_DLLRELEASE)r
r
r
r
r
########################################################r
# Physical intermediate filesr
########################################################r
r
r
r
"$(INTDIR_STATICRELEASE)\binarystring.obj": src/binarystring.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/binarystring.cxxr
r
"$(INTDIR_STATICDEBUG)\binarystring.obj": src/binarystring.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/binarystring.cxxr
r
r
"$(INTDIR_STATICRELEASE)\connection.obj": src/connection.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/connection.cxxr
r
"$(INTDIR_STATICDEBUG)\connection.obj": src/connection.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/connection.cxxr
r
r
"$(INTDIR_STATICRELEASE)\connection_base.obj": src/connection_base.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/connection_base.cxxr
r
"$(INTDIR_STATICDEBUG)\connection_base.obj": src/connection_base.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/connection_base.cxxr
r
r
"$(INTDIR_STATICRELEASE)\cursor.obj": src/cursor.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/cursor.cxxr
r
"$(INTDIR_STATICDEBUG)\cursor.obj": src/cursor.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/cursor.cxxr
r
r
"$(INTDIR_STATICRELEASE)\dbtransaction.obj": src/dbtransaction.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/dbtransaction.cxxr
r
"$(INTDIR_STATICDEBUG)\dbtransaction.obj": src/dbtransaction.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/dbtransaction.cxxr
r
r
"$(INTDIR_STATICRELEASE)\errorhandler.obj": src/errorhandler.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/errorhandler.cxxr
r
"$(INTDIR_STATICDEBUG)\errorhandler.obj": src/errorhandler.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/errorhandler.cxxr
r
r
"$(INTDIR_STATICRELEASE)\except.obj": src/except.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/except.cxxr
r
"$(INTDIR_STATICDEBUG)\except.obj": src/except.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/except.cxxr
r
r
"$(INTDIR_STATICRELEASE)\field.obj": src/field.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/field.cxxr
r
"$(INTDIR_STATICDEBUG)\field.obj": src/field.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/field.cxxr
r
r
"$(INTDIR_STATICRELEASE)\largeobject.obj": src/largeobject.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/largeobject.cxxr
r
"$(INTDIR_STATICDEBUG)\largeobject.obj": src/largeobject.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/largeobject.cxxr
r
r
"$(INTDIR_STATICRELEASE)\nontransaction.obj": src/nontransaction.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/nontransaction.cxxr
r
"$(INTDIR_STATICDEBUG)\nontransaction.obj": src/nontransaction.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/nontransaction.cxxr
r
r
"$(INTDIR_STATICRELEASE)\notification.obj": src/notification.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/notification.cxxr
r
"$(INTDIR_STATICDEBUG)\notification.obj": src/notification.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/notification.cxxr
r
r
"$(INTDIR_STATICRELEASE)\notify-listen.obj": src/notify-listen.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/notify-listen.cxxr
r
"$(INTDIR_STATICDEBUG)\notify-listen.obj": src/notify-listen.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/notify-listen.cxxr
r
r
"$(INTDIR_STATICRELEASE)\pipeline.obj": src/pipeline.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/pipeline.cxxr
r
"$(INTDIR_STATICDEBUG)\pipeline.obj": src/pipeline.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/pipeline.cxxr
r
r
"$(INTDIR_STATICRELEASE)\prepared_statement.obj": src/prepared_statement.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/prepared_statement.cxxr
r
"$(INTDIR_STATICDEBUG)\prepared_statement.obj": src/prepared_statement.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/prepared_statement.cxxr
r
r
"$(INTDIR_STATICRELEASE)\result.obj": src/result.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/result.cxxr
r
"$(INTDIR_STATICDEBUG)\result.obj": src/result.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/result.cxxr
r
r
"$(INTDIR_STATICRELEASE)\robusttransaction.obj": src/robusttransaction.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/robusttransaction.cxxr
r
"$(INTDIR_STATICDEBUG)\robusttransaction.obj": src/robusttransaction.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/robusttransaction.cxxr
r
r
"$(INTDIR_STATICRELEASE)\statement_parameters.obj": src/statement_parameters.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/statement_parameters.cxxr
r
"$(INTDIR_STATICDEBUG)\statement_parameters.obj": src/statement_parameters.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/statement_parameters.cxxr
r
r
"$(INTDIR_STATICRELEASE)\strconv.obj": src/strconv.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/strconv.cxxr
r
"$(INTDIR_STATICDEBUG)\strconv.obj": src/strconv.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/strconv.cxxr
r
r
"$(INTDIR_STATICRELEASE)\subtransaction.obj": src/subtransaction.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/subtransaction.cxxr
r
"$(INTDIR_STATICDEBUG)\subtransaction.obj": src/subtransaction.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/subtransaction.cxxr
r
r
"$(INTDIR_STATICRELEASE)\tablereader.obj": src/tablereader.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/tablereader.cxxr
r
"$(INTDIR_STATICDEBUG)\tablereader.obj": src/tablereader.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/tablereader.cxxr
r
r
"$(INTDIR_STATICRELEASE)\tablestream.obj": src/tablestream.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/tablestream.cxxr
r
"$(INTDIR_STATICDEBUG)\tablestream.obj": src/tablestream.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/tablestream.cxxr
r
r
"$(INTDIR_STATICRELEASE)\tablewriter.obj": src/tablewriter.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/tablewriter.cxxr
r
"$(INTDIR_STATICDEBUG)\tablewriter.obj": src/tablewriter.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/tablewriter.cxxr
r
r
"$(INTDIR_STATICRELEASE)\transaction.obj": src/transaction.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/transaction.cxxr
r
"$(INTDIR_STATICDEBUG)\transaction.obj": src/transaction.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/transaction.cxxr
r
r
"$(INTDIR_STATICRELEASE)\transaction_base.obj": src/transaction_base.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/transaction_base.cxxr
r
"$(INTDIR_STATICDEBUG)\transaction_base.obj": src/transaction_base.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/transaction_base.cxxr
r
r
"$(INTDIR_STATICRELEASE)\tuple.obj": src/tuple.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/tuple.cxxr
r
"$(INTDIR_STATICDEBUG)\tuple.obj": src/tuple.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/tuple.cxxr
r
r
"$(INTDIR_STATICRELEASE)\util.obj": src/util.cxx $(INTDIR_STATICRELEASE)r
	$(CXX) $(CXX_FLAGS_STATICRELEASE) /Fo"$(INTDIR_STATICRELEASE)\\" /Fd"$(INTDIR_STATICRELEASE)\\" src/util.cxxr
r
"$(INTDIR_STATICDEBUG)\util.obj": src/util.cxx $(INTDIR_STATICDEBUG)r
	$(CXX) $(CXX_FLAGS_STATICDEBUG) /Fo"$(INTDIR_STATICDEBUG)\\" /Fd"$(INTDIR_STATICDEBUG)\\" src/util.cxxr
r
r
r
r
"$(INTDIR_DLLRELEASE)\binarystring.obj": src/binarystring.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/binarystring.cxxr
r
"$(INTDIR_DLLDEBUG)\binarystring.obj": src/binarystring.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/binarystring.cxxr
r
r
"$(INTDIR_DLLRELEASE)\connection.obj": src/connection.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/connection.cxxr
r
"$(INTDIR_DLLDEBUG)\connection.obj": src/connection.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/connection.cxxr
r
r
"$(INTDIR_DLLRELEASE)\connection_base.obj": src/connection_base.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/connection_base.cxxr
r
"$(INTDIR_DLLDEBUG)\connection_base.obj": src/connection_base.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/connection_base.cxxr
r
r
"$(INTDIR_DLLRELEASE)\cursor.obj": src/cursor.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/cursor.cxxr
r
"$(INTDIR_DLLDEBUG)\cursor.obj": src/cursor.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/cursor.cxxr
r
r
"$(INTDIR_DLLRELEASE)\dbtransaction.obj": src/dbtransaction.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/dbtransaction.cxxr
r
"$(INTDIR_DLLDEBUG)\dbtransaction.obj": src/dbtransaction.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/dbtransaction.cxxr
r
r
"$(INTDIR_DLLRELEASE)\errorhandler.obj": src/errorhandler.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/errorhandler.cxxr
r
"$(INTDIR_DLLDEBUG)\errorhandler.obj": src/errorhandler.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/errorhandler.cxxr
r
r
"$(INTDIR_DLLRELEASE)\except.obj": src/except.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/except.cxxr
r
"$(INTDIR_DLLDEBUG)\except.obj": src/except.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/except.cxxr
r
r
"$(INTDIR_DLLRELEASE)\field.obj": src/field.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/field.cxxr
r
"$(INTDIR_DLLDEBUG)\field.obj": src/field.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/field.cxxr
r
r
"$(INTDIR_DLLRELEASE)\largeobject.obj": src/largeobject.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/largeobject.cxxr
r
"$(INTDIR_DLLDEBUG)\largeobject.obj": src/largeobject.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/largeobject.cxxr
r
r
"$(INTDIR_DLLRELEASE)\nontransaction.obj": src/nontransaction.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/nontransaction.cxxr
r
"$(INTDIR_DLLDEBUG)\nontransaction.obj": src/nontransaction.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/nontransaction.cxxr
r
r
"$(INTDIR_DLLRELEASE)\notification.obj": src/notification.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/notification.cxxr
r
"$(INTDIR_DLLDEBUG)\notification.obj": src/notification.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/notification.cxxr
r
r
"$(INTDIR_DLLRELEASE)\notify-listen.obj": src/notify-listen.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/notify-listen.cxxr
r
"$(INTDIR_DLLDEBUG)\notify-listen.obj": src/notify-listen.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/notify-listen.cxxr
r
r
"$(INTDIR_DLLRELEASE)\pipeline.obj": src/pipeline.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/pipeline.cxxr
r
"$(INTDIR_DLLDEBUG)\pipeline.obj": src/pipeline.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/pipeline.cxxr
r
r
"$(INTDIR_DLLRELEASE)\prepared_statement.obj": src/prepared_statement.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/prepared_statement.cxxr
r
"$(INTDIR_DLLDEBUG)\prepared_statement.obj": src/prepared_statement.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/prepared_statement.cxxr
r
r
"$(INTDIR_DLLRELEASE)\result.obj": src/result.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/result.cxxr
r
"$(INTDIR_DLLDEBUG)\result.obj": src/result.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/result.cxxr
r
r
"$(INTDIR_DLLRELEASE)\robusttransaction.obj": src/robusttransaction.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/robusttransaction.cxxr
r
"$(INTDIR_DLLDEBUG)\robusttransaction.obj": src/robusttransaction.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/robusttransaction.cxxr
r
r
"$(INTDIR_DLLRELEASE)\statement_parameters.obj": src/statement_parameters.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/statement_parameters.cxxr
r
"$(INTDIR_DLLDEBUG)\statement_parameters.obj": src/statement_parameters.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/statement_parameters.cxxr
r
r
"$(INTDIR_DLLRELEASE)\strconv.obj": src/strconv.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/strconv.cxxr
r
"$(INTDIR_DLLDEBUG)\strconv.obj": src/strconv.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/strconv.cxxr
r
r
"$(INTDIR_DLLRELEASE)\subtransaction.obj": src/subtransaction.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/subtransaction.cxxr
r
"$(INTDIR_DLLDEBUG)\subtransaction.obj": src/subtransaction.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/subtransaction.cxxr
r
r
"$(INTDIR_DLLRELEASE)\tablereader.obj": src/tablereader.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/tablereader.cxxr
r
"$(INTDIR_DLLDEBUG)\tablereader.obj": src/tablereader.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/tablereader.cxxr
r
r
"$(INTDIR_DLLRELEASE)\tablestream.obj": src/tablestream.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/tablestream.cxxr
r
"$(INTDIR_DLLDEBUG)\tablestream.obj": src/tablestream.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/tablestream.cxxr
r
r
"$(INTDIR_DLLRELEASE)\tablewriter.obj": src/tablewriter.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/tablewriter.cxxr
r
"$(INTDIR_DLLDEBUG)\tablewriter.obj": src/tablewriter.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/tablewriter.cxxr
r
r
"$(INTDIR_DLLRELEASE)\transaction.obj": src/transaction.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/transaction.cxxr
r
"$(INTDIR_DLLDEBUG)\transaction.obj": src/transaction.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/transaction.cxxr
r
r
"$(INTDIR_DLLRELEASE)\transaction_base.obj": src/transaction_base.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/transaction_base.cxxr
r
"$(INTDIR_DLLDEBUG)\transaction_base.obj": src/transaction_base.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/transaction_base.cxxr
r
r
"$(INTDIR_DLLRELEASE)\tuple.obj": src/tuple.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/tuple.cxxr
r
"$(INTDIR_DLLDEBUG)\tuple.obj": src/tuple.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/tuple.cxxr
r
r
"$(INTDIR_DLLRELEASE)\util.obj": src/util.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" src/util.cxxr
r
"$(INTDIR_DLLDEBUG)\util.obj": src/util.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" src/util.cxxr
r
r
"$(INTDIR_DLLRELEASE)\libpqxx.obj": win32/libpqxx.cxx $(INTDIR_DLLRELEASE)r
	$(CXX) $(CXX_FLAGS_DLLRELEASE) /Fo"$(INTDIR_DLLRELEASE)\\" /Fd"$(INTDIR_DLLRELEASE)\\" win32/libpqxx.cxxr
r
"$(INTDIR_DLLDEBUG)\libpqxx.obj": win32/libpqxx.cxx $(INTDIR_DLLDEBUG)r
	$(CXX) $(CXX_FLAGS_DLLDEBUG) /Fo"$(INTDIR_DLLDEBUG)\\" /Fd"$(INTDIR_DLLDEBUG)\\" win32/libpqxx.cxxr
r
r
