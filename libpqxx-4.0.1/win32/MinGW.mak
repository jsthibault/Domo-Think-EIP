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
# Generated from template '/Users/mowgli/cpp/libpqxx-4.0.1/win32/mingw.mak.template'.r
################################################################################r
# MinGW makefile for libpqxx.  Don't use this; use the configure script instead!r
# Based on original contributed by Pasquale Fersini <basquale.fersini@libero.it>r
r
include win32/commonr
r
CXX = g++.exer
r
OBJ = \r
  src/binarystring.o \r
  src/connection.o \r
  src/connection_base.o \r
  src/cursor.o \r
  src/dbtransaction.o \r
  src/errorhandler.o \r
  src/except.o \r
  src/field.o \r
  src/largeobject.o \r
  src/nontransaction.o \r
  src/notification.o \r
  src/notify-listen.o \r
  src/pipeline.o \r
  src/prepared_statement.o \r
  src/result.o \r
  src/robusttransaction.o \r
  src/statement_parameters.o \r
  src/strconv.o \r
  src/subtransaction.o \r
  src/tablereader.o \r
  src/tablestream.o \r
  src/tablewriter.o \r
  src/transaction.o \r
  src/transaction_base.o \r
  src/tuple.o \r
  src/util.o \r
r
r
LDFLAGS = -L$(LIBPQPATH) --export-all-symbols --add-stdcall-alias -fpicr
LIBS = -lpq -lm -lws2_32r
r
CPPFLAGS = -Iinclude -I$(PGSQLINC) -I$(LIBPQINC) \r
  -DBUILDING_DLL -DPQXX_SHARED -DPGSTD=$(STD)r
r
BIN = libpqxx.dllr
r
.PHONY: all cleanr
r
all: libpqxx.dllr
r
clean:r
	rm -f $(OBJ) $(BIN)r
r
DLLWRAP=dllwrap.exer
DEFFILE=libpqxx.defr
STATICLIB=libpqxx.ar
r
$(BIN): $(OBJ)r
	$(DLLWRAP) --output-def $(DEFFILE) --driver-name c++ --implib $(STATICLIB) $(OBJ) $(LDFLAGS) $(LIBS) -o $(BIN)r
r
src/binarystring.o: src/binarystring.cxxr
	$(CXX) $(CPPFLAGS) -c src/binarystring.cxx -o src/binarystring.o $(CXXFLAGS)r
r
src/connection.o: src/connection.cxxr
	$(CXX) $(CPPFLAGS) -c src/connection.cxx -o src/connection.o $(CXXFLAGS)r
r
src/connection_base.o: src/connection_base.cxxr
	$(CXX) $(CPPFLAGS) -c src/connection_base.cxx -o src/connection_base.o $(CXXFLAGS)r
r
src/cursor.o: src/cursor.cxxr
	$(CXX) $(CPPFLAGS) -c src/cursor.cxx -o src/cursor.o $(CXXFLAGS)r
r
src/dbtransaction.o: src/dbtransaction.cxxr
	$(CXX) $(CPPFLAGS) -c src/dbtransaction.cxx -o src/dbtransaction.o $(CXXFLAGS)r
r
src/errorhandler.o: src/errorhandler.cxxr
	$(CXX) $(CPPFLAGS) -c src/errorhandler.cxx -o src/errorhandler.o $(CXXFLAGS)r
r
src/except.o: src/except.cxxr
	$(CXX) $(CPPFLAGS) -c src/except.cxx -o src/except.o $(CXXFLAGS)r
r
src/field.o: src/field.cxxr
	$(CXX) $(CPPFLAGS) -c src/field.cxx -o src/field.o $(CXXFLAGS)r
r
src/largeobject.o: src/largeobject.cxxr
	$(CXX) $(CPPFLAGS) -c src/largeobject.cxx -o src/largeobject.o $(CXXFLAGS)r
r
src/nontransaction.o: src/nontransaction.cxxr
	$(CXX) $(CPPFLAGS) -c src/nontransaction.cxx -o src/nontransaction.o $(CXXFLAGS)r
r
src/notification.o: src/notification.cxxr
	$(CXX) $(CPPFLAGS) -c src/notification.cxx -o src/notification.o $(CXXFLAGS)r
r
src/notify-listen.o: src/notify-listen.cxxr
	$(CXX) $(CPPFLAGS) -c src/notify-listen.cxx -o src/notify-listen.o $(CXXFLAGS)r
r
src/pipeline.o: src/pipeline.cxxr
	$(CXX) $(CPPFLAGS) -c src/pipeline.cxx -o src/pipeline.o $(CXXFLAGS)r
r
src/prepared_statement.o: src/prepared_statement.cxxr
	$(CXX) $(CPPFLAGS) -c src/prepared_statement.cxx -o src/prepared_statement.o $(CXXFLAGS)r
r
src/result.o: src/result.cxxr
	$(CXX) $(CPPFLAGS) -c src/result.cxx -o src/result.o $(CXXFLAGS)r
r
src/robusttransaction.o: src/robusttransaction.cxxr
	$(CXX) $(CPPFLAGS) -c src/robusttransaction.cxx -o src/robusttransaction.o $(CXXFLAGS)r
r
src/statement_parameters.o: src/statement_parameters.cxxr
	$(CXX) $(CPPFLAGS) -c src/statement_parameters.cxx -o src/statement_parameters.o $(CXXFLAGS)r
r
src/strconv.o: src/strconv.cxxr
	$(CXX) $(CPPFLAGS) -c src/strconv.cxx -o src/strconv.o $(CXXFLAGS)r
r
src/subtransaction.o: src/subtransaction.cxxr
	$(CXX) $(CPPFLAGS) -c src/subtransaction.cxx -o src/subtransaction.o $(CXXFLAGS)r
r
src/tablereader.o: src/tablereader.cxxr
	$(CXX) $(CPPFLAGS) -c src/tablereader.cxx -o src/tablereader.o $(CXXFLAGS)r
r
src/tablestream.o: src/tablestream.cxxr
	$(CXX) $(CPPFLAGS) -c src/tablestream.cxx -o src/tablestream.o $(CXXFLAGS)r
r
src/tablewriter.o: src/tablewriter.cxxr
	$(CXX) $(CPPFLAGS) -c src/tablewriter.cxx -o src/tablewriter.o $(CXXFLAGS)r
r
src/transaction.o: src/transaction.cxxr
	$(CXX) $(CPPFLAGS) -c src/transaction.cxx -o src/transaction.o $(CXXFLAGS)r
r
src/transaction_base.o: src/transaction_base.cxxr
	$(CXX) $(CPPFLAGS) -c src/transaction_base.cxx -o src/transaction_base.o $(CXXFLAGS)r
r
src/tuple.o: src/tuple.cxxr
	$(CXX) $(CPPFLAGS) -c src/tuple.cxx -o src/tuple.o $(CXXFLAGS)r
r
src/util.o: src/util.cxxr
	$(CXX) $(CPPFLAGS) -c src/util.cxx -o src/util.o $(CXXFLAGS)r
r
r
