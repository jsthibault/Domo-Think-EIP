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
# Generated from template '/Users/mowgli/cpp/libpqxx-4.0.1/win32/vc-test-unit.mak.template'.r
################################################################################r
# Visual C++ Makefile for libpqxx unit testsr
# This file was written by Sam Kapilivsky, based on Bart Samwel's original.r
r
default:r
	@echo LIBPQXX unit test suite Makefile for Visual C++ Available Targetsr
	@echo -----------------------------------------------------------------r
	@echo.r
	@echo ALL: perform all testsr
	@echo TEST_xxx: perform specific test xxxr
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
    /I "include" /I "test" /I $(PGSQLINC) /I $(LIBPQINC) \r
    /D "WIN32" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" $(PQXX_SHARED)r
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
INTDIR=Unit$(PQXXLIBTYPE)$(BUILDMODE)r
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
  $(INTDIR)\test_binarystring.obj \r
  $(INTDIR)\test_cancel_query.obj \r
  $(INTDIR)\test_error_verbosity.obj \r
  $(INTDIR)\test_errorhandler.obj \r
  $(INTDIR)\test_escape.obj \r
  $(INTDIR)\test_exceptions.obj \r
  $(INTDIR)\test_float.obj \r
  $(INTDIR)\test_notification.obj \r
  $(INTDIR)\test_parameterized.obj \r
  $(INTDIR)\test_pipeline.obj \r
  $(INTDIR)\test_prepared_statement.obj \r
  $(INTDIR)\test_read_transaction.obj \r
  $(INTDIR)\test_result_slicing.obj \r
  $(INTDIR)\test_simultaneous_transactions.obj \r
  $(INTDIR)\test_sql_cursor.obj \r
  $(INTDIR)\test_stateless_cursor.obj \r
  $(INTDIR)\test_string_conversion.obj \r
  $(INTDIR)\test_test_helpers.obj \r
  $(INTDIR)\test_thread_safety_model.obj \r
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
	@$(LINK) $(LINK_FLAGS) $(OBJS) $(PQXXLIB) /out:"$(INTDIR)\\runner.exe"r
r
r
$(INTDIR)\runner.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/runner.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_binarystring.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_binarystring.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_cancel_query.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_cancel_query.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_error_verbosity.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_error_verbosity.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_errorhandler.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_errorhandler.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_escape.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_escape.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_exceptions.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_exceptions.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_float.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_float.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_notification.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_notification.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_parameterized.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_parameterized.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_pipeline.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_pipeline.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_prepared_statement.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_prepared_statement.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_read_transaction.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_read_transaction.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_result_slicing.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_result_slicing.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_simultaneous_transactions.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_simultaneous_transactions.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_sql_cursor.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_sql_cursor.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_stateless_cursor.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_stateless_cursor.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_string_conversion.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_string_conversion.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_test_helpers.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_test_helpers.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
$(INTDIR)\test_thread_safety_model.obj:r
	@$(CXX) $(CXX_FLAGS) test/unit/test_thread_safety_model.cxx /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"r
r
r
$(INTDIR)\$(LIBPQ):r
	@copy $(LIBDIR)\$(LIBPQ) $(INTDIR)r
r
r
$(INTDIR)\$(PQXX):r
	@copy $(LIBDIR)\$(PQXX) $(INTDIR)r
