﻿using Acme.SimpleTaskApp.Configuration;
using Acme.SimpleTaskApp.Web;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.Configuration;

namespace Acme.SimpleTaskApp.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class SimpleTaskAppDbContextFactory : IDbContextFactory<SimpleTaskAppDbContext>
    {
        public SimpleTaskAppDbContext Create(DbContextFactoryOptions options)
        {
            var builder = new DbContextOptionsBuilder<SimpleTaskAppDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            DbContextOptionsConfigurer.Configure(
                builder,
                configuration.GetConnectionString(SimpleTaskAppConsts.ConnectionStringName)
                );

            return new SimpleTaskAppDbContext(builder.Options);
        }
    }
}