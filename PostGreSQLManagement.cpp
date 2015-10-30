#include "PostGreSQLManagement.hh"

PostGreSQLmanagement::PostGreSQLmanagement(const std::string dbname, const std::string host, const std::string user)
{
  const std::string res = "dbname="  + dbname + " host=" + host + " user=" + user;
  this->_conn = PQconnectdb(res.c_str());
  if (PQstatus(this->_conn) != CONNECTION_OK)
    {
      std::cout << "Il faut throw ici postgresqlmangeement.cpp" << std::endl;
    }
}

PostGreSQLmanagement::PostGreSQLmanagement(const std::string dbname, const std::string host, const std::string user, const std::string password)
{
  const std::string res = "dbname="  + dbname + " host=" + host + " user=" + user + " password=" + password;
  this->_conn = PQconnectdb(res.c_str());
  if (PQstatus(this->_conn) != CONNECTION_OK)
    {
      std::cout << "Il faut throw ici postgresqlmangeement.cpp" << std::endl;
    }
}

PostGreSQLmanagement::~PostGreSQLmanagement()
{
  PQfinish(this->_conn);
}

std::string       PostGreSQLmanagement::QueryBasic(const std::string query)
{
  PGresult        *res;
  std::string     ret = "";
  int             nFields;
  
  res = PQexec(this->_conn, query.c_str());
  nFields = PQnfields(res);
  for (int i = 0; i < PQntuples(res); i++)
    {
      for (int j = 0; j < nFields; j++)
	{
	  ret += PQgetvalue(res, i, j);
	  ret += "\n";
	}
    }
  return (ret);
}
