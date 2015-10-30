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
# Generated from template '/Users/mowgli/cpp/libpqxx-4.0.1/win32/vc-test.mak.template'.r
################################################################################r
# Visual C++ Makefile for libpqxx test suiter
# This file was written by Bart Samwel.r
r
default:r
	@echo LIBPQXX testsuite Makefile for Visual C++ Available Targetsr
	@echo -----------------------------------------------------------r
	@echo.r
	@echo ALL: perform all testsr
	@echo TESTxxx: perform specific test xxxr
	@echo CLEAN: clean up all output so that tests will run again.r
	@echo.r
	@echo Pass the option DLL=1 to link the test suite against the libpqxx DLL insteadr
	@echo of against the static libpqxx library, and pass DEBUG=1 to link againstr
	@echo the debug build of libpqxx.r
r
!include win32\commonr
r
LIBDIR=libr
r
r
# C++ compiler, linkerr
CXX=cl.exer
LINK=link.exer
r
!IF "$(DLL)" == "1"r
PQXX_SHARED=/D "PQXX_SHARED"r
PQXXLIBTYPE=Dllr
PQXXLIBTYPESUFFIX=r
PQXXLIBEXT=dllr
!ELSEr
PQXXLIBTYPE=Staticr
PQXXLIBEXT=libr
PQXXLIBTYPESUFFIX=_staticr
!ENDIFr
r
r
CXX_FLAGS_BASE=/nologo /W3 /EHsc /FD /GR /c \r
    /I "include" /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" $(PQXX_SHARED)r
r
LINK_FLAGS_BASE=kernel32.lib ws2_32.lib advapi32.lib /nologo /machine:I386 /libpath:"$(LIBDIR)"r
r
r
!IF "$(DEBUG)" == "1"r
BUILDMODE=Debugr
DEBUGSUFFIX=Dr
CXX_FLAGS=$(CXX_FLAGS_BASE) /MDd /Gm /ZI /Od /D "_DEBUG" /RTC1r
LINK_FLAGS=$(LINK_FLAGS_BASE) $(LIBPQDLIB) /debugr
LIBPQ=$(LIBPQDDLL)r
!ELSEr
BUILDMODE=Releaser
DEBUGSUFFIX=r
CXX_FLAGS=$(CXX_FLAGS_BASE) /MD /D "NDEBUG"r
LINK_FLAGS=$(LINK_FLAGS_BASE) $(LIBPQLIB)r
LIBPQ=$(LIBPQDLL)r
!ENDIFr
r
r
INTDIR=Test$(PQXXLIBTYPE)$(BUILDMODE)r
PQXXLIB=libpqxx$(PQXXLIBTYPESUFFIX)$(DEBUGSUFFIX).libr
PQXX=libpqxx$(DEBUGSUFFIX).dllr
r
!IF "$(DLL)" == "1"r
DLLS=$(INTDIR)\$(LIBPQ) $(INTDIR)\$(PQXX)r
!ELSEr
DLLS=$(INTDIR)\$(LIBPQ)r
!ENDIFr
r
OBJS= \r
  $(INTDIR)\test000.obj \r
  $(INTDIR)\test001.obj \r
  $(INTDIR)\test002.obj \r
  $(INTDIR)\test004.obj \r
  $(INTDIR)\test007.obj \r
  $(INTDIR)\test010.obj \r
  $(INTDIR)\test011.obj \r
  $(INTDIR)\test012.obj \r
  $(INTDIR)\test013.obj \r
  $(INTDIR)\test014.obj \r
  $(INTDIR)\test015.obj \r
  $(INTDIR)\test016.obj \r
  $(INTDIR)\test017.obj \r
  $(INTDIR)\test018.obj \r
  $(INTDIR)\test020.obj \r
  $(INTDIR)\test021.obj \r
  $(INTDIR)\test023.obj \r
  $(INTDIR)\test026.obj \r
  $(INTDIR)\test029.obj \r
  $(INTDIR)\test030.obj \r
  $(INTDIR)\test031.obj \r
  $(INTDIR)\test032.obj \r
  $(INTDIR)\test033.obj \r
  $(INTDIR)\test034.obj \r
  $(INTDIR)\test035.obj \r
  $(INTDIR)\test036.obj \r
  $(INTDIR)\test037.obj \r
  $(INTDIR)\test039.obj \r
  $(INTDIR)\test046.obj \r
  $(INTDIR)\test048.obj \r
  $(INTDIR)\test049.obj \r
  $(INTDIR)\test050.obj \r
  $(INTDIR)\test051.obj \r
  $(INTDIR)\test052.obj \r
  $(INTDIR)\test053.obj \r
  $(INTDIR)\test054.obj \r
  $(INTDIR)\test055.obj \r
  $(INTDIR)\test056.obj \r
  $(INTDIR)\test057.obj \r
  $(INTDIR)\test058.obj \r
  $(INTDIR)\test059.obj \r
  $(INTDIR)\test060.obj \r
  $(INTDIR)\test061.obj \r
  $(INTDIR)\test062.obj \r
  $(INTDIR)\test063.obj \r
  $(INTDIR)\test064.obj \r
  $(INTDIR)\test065.obj \r
  $(INTDIR)\test066.obj \r
  $(INTDIR)\test067.obj \r
  $(INTDIR)\test069.obj \r
  $(INTDIR)\test070.obj \r
  $(INTDIR)\test071.obj \r
  $(INTDIR)\test072.obj \r
  $(INTDIR)\test073.obj \r
  $(INTDIR)\test074.obj \r
  $(INTDIR)\test075.obj \r
  $(INTDIR)\test076.obj \r
  $(INTDIR)\test077.obj \r
  $(INTDIR)\test078.obj \r
  $(INTDIR)\test079.obj \r
  $(INTDIR)\test082.obj \r
  $(INTDIR)\test083.obj \r
  $(INTDIR)\test084.obj \r
  $(INTDIR)\test086.obj \r
  $(INTDIR)\test087.obj \r
  $(INTDIR)\test088.obj \r
  $(INTDIR)\test089.obj \r
  $(INTDIR)\test090.obj \r
  $(INTDIR)\test092.obj \r
  $(INTDIR)\test093.obj \r
  $(INTDIR)\test094.obj \r
  $(INTDIR)\runner.objr
r
r
########################################################r
# Logical targetsr
########################################################r
r
all: runnerr
r
runner: $(INTDIR) $(INTDIR)\runner.exer
r
clean:r
	-@del /Q $(INTDIR)\*.*r
r
$(INTDIR):r
	@mkdir $(INTDIR)r
r
r
########################################################r
# Test implementationsr
########################################################r
r
r
$(INTDIR)\runner.success: $(INTDIR)\runner.exer
	@$(INTDIR)\runner.exer
	@echo >$(INTDIR)\runner.successr
r
r
$(INTDIR)\runner.exe: $(OBJS) $(DLLS)r
	@$(LINK) $(LINK_FLAGS) $(OBJS) $(PQXXLIB) \r
		/out:"$(INTDIR)\\runner.exe"r
r
r
$(INTDIR)\runner.obj:r
	@$(CXX) $(CXX_FLAGS) test/runner.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test000.obj:r
	@$(CXX) $(CXX_FLAGS) test/test000.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test001.obj:r
	@$(CXX) $(CXX_FLAGS) test/test001.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test002.obj:r
	@$(CXX) $(CXX_FLAGS) test/test002.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test004.obj:r
	@$(CXX) $(CXX_FLAGS) test/test004.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test007.obj:r
	@$(CXX) $(CXX_FLAGS) test/test007.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test010.obj:r
	@$(CXX) $(CXX_FLAGS) test/test010.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test011.obj:r
	@$(CXX) $(CXX_FLAGS) test/test011.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test012.obj:r
	@$(CXX) $(CXX_FLAGS) test/test012.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test013.obj:r
	@$(CXX) $(CXX_FLAGS) test/test013.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test014.obj:r
	@$(CXX) $(CXX_FLAGS) test/test014.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test015.obj:r
	@$(CXX) $(CXX_FLAGS) test/test015.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test016.obj:r
	@$(CXX) $(CXX_FLAGS) test/test016.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test017.obj:r
	@$(CXX) $(CXX_FLAGS) test/test017.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test018.obj:r
	@$(CXX) $(CXX_FLAGS) test/test018.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test020.obj:r
	@$(CXX) $(CXX_FLAGS) test/test020.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test021.obj:r
	@$(CXX) $(CXX_FLAGS) test/test021.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test023.obj:r
	@$(CXX) $(CXX_FLAGS) test/test023.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test026.obj:r
	@$(CXX) $(CXX_FLAGS) test/test026.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test029.obj:r
	@$(CXX) $(CXX_FLAGS) test/test029.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test030.obj:r
	@$(CXX) $(CXX_FLAGS) test/test030.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test031.obj:r
	@$(CXX) $(CXX_FLAGS) test/test031.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test032.obj:r
	@$(CXX) $(CXX_FLAGS) test/test032.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test033.obj:r
	@$(CXX) $(CXX_FLAGS) test/test033.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test034.obj:r
	@$(CXX) $(CXX_FLAGS) test/test034.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test035.obj:r
	@$(CXX) $(CXX_FLAGS) test/test035.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test036.obj:r
	@$(CXX) $(CXX_FLAGS) test/test036.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test037.obj:r
	@$(CXX) $(CXX_FLAGS) test/test037.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test039.obj:r
	@$(CXX) $(CXX_FLAGS) test/test039.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test046.obj:r
	@$(CXX) $(CXX_FLAGS) test/test046.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test048.obj:r
	@$(CXX) $(CXX_FLAGS) test/test048.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test049.obj:r
	@$(CXX) $(CXX_FLAGS) test/test049.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test050.obj:r
	@$(CXX) $(CXX_FLAGS) test/test050.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test051.obj:r
	@$(CXX) $(CXX_FLAGS) test/test051.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test052.obj:r
	@$(CXX) $(CXX_FLAGS) test/test052.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test053.obj:r
	@$(CXX) $(CXX_FLAGS) test/test053.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test054.obj:r
	@$(CXX) $(CXX_FLAGS) test/test054.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test055.obj:r
	@$(CXX) $(CXX_FLAGS) test/test055.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test056.obj:r
	@$(CXX) $(CXX_FLAGS) test/test056.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test057.obj:r
	@$(CXX) $(CXX_FLAGS) test/test057.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test058.obj:r
	@$(CXX) $(CXX_FLAGS) test/test058.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test059.obj:r
	@$(CXX) $(CXX_FLAGS) test/test059.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test060.obj:r
	@$(CXX) $(CXX_FLAGS) test/test060.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test061.obj:r
	@$(CXX) $(CXX_FLAGS) test/test061.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test062.obj:r
	@$(CXX) $(CXX_FLAGS) test/test062.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test063.obj:r
	@$(CXX) $(CXX_FLAGS) test/test063.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test064.obj:r
	@$(CXX) $(CXX_FLAGS) test/test064.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test065.obj:r
	@$(CXX) $(CXX_FLAGS) test/test065.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test066.obj:r
	@$(CXX) $(CXX_FLAGS) test/test066.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test067.obj:r
	@$(CXX) $(CXX_FLAGS) test/test067.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test069.obj:r
	@$(CXX) $(CXX_FLAGS) test/test069.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test070.obj:r
	@$(CXX) $(CXX_FLAGS) test/test070.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test071.obj:r
	@$(CXX) $(CXX_FLAGS) test/test071.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test072.obj:r
	@$(CXX) $(CXX_FLAGS) test/test072.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test073.obj:r
	@$(CXX) $(CXX_FLAGS) test/test073.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test074.obj:r
	@$(CXX) $(CXX_FLAGS) test/test074.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test075.obj:r
	@$(CXX) $(CXX_FLAGS) test/test075.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test076.obj:r
	@$(CXX) $(CXX_FLAGS) test/test076.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test077.obj:r
	@$(CXX) $(CXX_FLAGS) test/test077.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test078.obj:r
	@$(CXX) $(CXX_FLAGS) test/test078.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test079.obj:r
	@$(CXX) $(CXX_FLAGS) test/test079.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test082.obj:r
	@$(CXX) $(CXX_FLAGS) test/test082.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test083.obj:r
	@$(CXX) $(CXX_FLAGS) test/test083.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test084.obj:r
	@$(CXX) $(CXX_FLAGS) test/test084.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test086.obj:r
	@$(CXX) $(CXX_FLAGS) test/test086.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test087.obj:r
	@$(CXX) $(CXX_FLAGS) test/test087.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test088.obj:r
	@$(CXX) $(CXX_FLAGS) test/test088.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test089.obj:r
	@$(CXX) $(CXX_FLAGS) test/test089.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test090.obj:r
	@$(CXX) $(CXX_FLAGS) test/test090.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test092.obj:r
	@$(CXX) $(CXX_FLAGS) test/test092.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test093.obj:r
	@$(CXX) $(CXX_FLAGS) test/test093.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test094.obj:r
	@$(CXX) $(CXX_FLAGS) test/test094.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
r
r
$(INTDIR)\$(LIBPQ):r
	@copy $(LIBDIR)\$(LIBPQ) $(INTDIR)r
r
$(INTDIR)\$(PQXX):r
	@copy $(LIBDIR)\$(PQXX) $(INTDIR)r
