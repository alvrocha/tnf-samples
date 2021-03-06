﻿using Microsoft.EntityFrameworkCore;
using SuperMarket.FiscalService.Domain.Entities;
using Tnf.EntityFrameworkCore;
using Tnf.Runtime.Session;

namespace SuperMarket.FiscalService.Infra.Contexts
{
    public class FiscalContext : TnfDbContext
    {
        public DbSet<TaxMoviment> TaxMoviments { get; set; }

        public FiscalContext(DbContextOptions<FiscalContext> options, ITnfSession session) 
            : base(options, session)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.ApplyConfiguration(new PurchaseOrderTaxMovimentMapper());
        }
    }
}
