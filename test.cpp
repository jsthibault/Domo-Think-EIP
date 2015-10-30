#include "PostGreSQLManagement.hh"


int      main(int ac, char **av)
{
  if (ac >= 2)
    {
      PostGreSQLmanagement test(av[1], "localhost", "mowgli");
      std::cout << test.QueryBasic("SELECT nom FROM maison;") << std::endl;
    }
  
  //  pqxx::connection Conn("dbname=test host=localhost user=mowgli");
  /*  PGconn          *conn;
  PGresult        *res;
  int             rec_count;
  int             nFields;
  
  std::cout << "LOL" << std::endl;
  conn = PQconnectdb("dbname=test host=localhost user=mowgli");

  if (PQstatus(conn) == CONNECTION_BAD)
    {
      puts("We were unable to connect to the database");
      exit(0);
      }
  res = PQexec(conn, "SELECT nom FROM maison;");
  if (res == NULL)
    std::cout << "FAILE" << std::endl;
  printf("%s\n", res);
  nFields = PQnfields(res);
  for (int i = 0; i < nFields; i++)
    printf("%-30s\n", PQfname(res, i));
  for (int i = 0; i < PQntuples(res); i++)
    {
      for (int j = 0; j < nFields; j++)
	printf("%-30s", PQgetvalue(res, i, j));
      printf("\n");
    }
    PQfinish(conn);*/
}
