﻿using BasicCrud.Application;
using BasicCrud.Domain;
using BasicCrud.Infra;
using BasicCrud.Infra.SqlServer.Context;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace BasicCrud.Web.Tests
{
    public class StartupIntegratedTest
    {
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {            
            services
                .AddMapperDependency()              // Configura o mesmo Mapper para ser testado
                .AddApplicationServiceDependency()  // Configura a mesma dependencia da camada web a ser testada   
                .AddTnfAspNetCoreSetupTest()        // Configura o setup de teste para AspNetCore
                .AddTnfEfCoreSqliteInMemory()       // Configura o setup de teste para EntityFrameworkCore em memória
                .RegisterDbContextToSqliteInMemory<BasicCrudDbContext>();    // Configura o cotexto a ser usado em memória pelo EntityFrameworkCore

            return services.BuildServiceProvider();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app)
        {
            // Configura o uso do teste
            app.UseTnfAspNetCoreSetupTest(options =>
            {
                // Adiciona as configurações de localização da aplicação a ser testada
                options.UseDomainLocalization();

                // Configuração para usar teste com EntityFramework em memória
                //options.UnitOfWorkOptions().IsolationLevel = IsolationLevel.Unspecified;
            });

            // Habilita o uso do UnitOfWork em todo o request
            app.UseTnfUnitOfWork();

            app.UseMvc(routes =>
            {
                routes.MapRoute("default", "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
