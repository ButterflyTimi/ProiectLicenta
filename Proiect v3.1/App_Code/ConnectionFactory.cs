﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

public class ConnectionFactory
{
    private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ASPNETDB"].ConnectionString.ToString();

    public static SqlConnection getNewSqlConnection()
    {
        return new SqlConnection(connectionString);
    }
        
}