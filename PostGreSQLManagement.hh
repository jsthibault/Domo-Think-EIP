#ifndef POSTGRESQLMANAGEMENT_HH_
# define POSTGRESQLMANAGEMENT_HH_

# include <libpq-fe.h>
# include <pqxx/pqxx>
# include <string>
# include <iostream>


class                PostGreSQLmanagement
{
private:
  PGconn             *_conn;
public:
  PostGreSQLmanagement(const std::string dbname, const std::string host, const std::string user);
  PostGreSQLmanagement(const std::string dbname, const std::string host, const std::string user, const std::string password);
  ~PostGreSQLmanagement();
  
  std::string     QueryBasic(const std::string query);
  
};

#endif 
