﻿using Microsoft.EntityFrameworkCore;
using SuperMarket.Backoffice.Crud.Domain.Entities;
using SuperMarket.Backoffice.Crud.Infra.Contexts;
using SuperMarket.Backoffice.Crud.Infra.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Tnf.Caching;
using Tnf.EntityFrameworkCore;
using Tnf.EntityFrameworkCore.Repositories;
using Tnf.Repositories;

namespace SuperMarket.Backoffice.Crud.Infra.Repositories
{
    public class ProductRepository : EfCoreRepositoryBase<CrudContext, Product>, IRepository<Product>, IPriceTableRepository
    {
        public readonly ICache _cache;
        private const string PriceTableKey = "ProductPriceTable";

        public ProductRepository(IDbContextProvider<CrudContext> dbContextProvider, ICache cache) 
            : base(dbContextProvider)
        {
            _cache = cache;
        }

        public Task<Dictionary<Guid, decimal>> GetPriceTable()
        {
            return _cache.GetOrAddAsync(PriceTableKey, async () =>
            {
                var query = await GetAll()
                    .Select(s => new
                    {
                        s.Id,
                        s.Value
                    })
                    .ToListAsync();

                return query.ToDictionary(k => k.Id, v => v.Value);
            }, 
            TimeSpan.FromMinutes(10));
        }

        public override async Task<Product> InsertAndSaveChangesAsync(Product entity)
        {
            await _cache.DeleteKeyAsync(PriceTableKey);

            return await base.InsertAndSaveChangesAsync(entity);
        }

        public override async Task<Product> UpdateAsync(Product entity)
        {
            await _cache.DeleteKeyAsync(PriceTableKey);

            return await base.UpdateAsync(entity);
        }

        public override async Task DeleteAsync(Expression<Func<Product, bool>> predicate)
        {
            await _cache.DeleteKeyAsync(PriceTableKey);

            await base.DeleteAsync(predicate);
        }
    }
}
