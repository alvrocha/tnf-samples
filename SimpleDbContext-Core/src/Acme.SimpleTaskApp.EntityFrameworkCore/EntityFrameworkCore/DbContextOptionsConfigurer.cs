﻿using Microsoft.EntityFrameworkCore;
using System.Data.Common;
using System.Data.SqlClient;

namespace Acme.SimpleTaskApp.EntityFrameworkCore
{
    public static class DbContextOptionsConfigurer
    {
        static DbContextOptionsConfigurer()
        {
        }
        
        public static void Configure(DbContextOptionsBuilder<SimpleTaskAppDbContext> dbContextOptions,string connectionString)
        {
            /* This is the single point to configure DbContextOptions for SimpleTaskAppDbContext */
            dbContextOptions.UseSqlServer(connectionString);
        }
    }
}
