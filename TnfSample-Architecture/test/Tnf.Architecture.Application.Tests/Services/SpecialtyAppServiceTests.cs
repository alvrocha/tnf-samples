﻿using Tnf.App.EntityFrameworkCore.TestBase;
using Tnf.Architecture.EntityFrameworkCore;
using Xunit;
using Shouldly;
using Tnf.Architecture.EntityFrameworkCore.Entities;
using Tnf.Architecture.Application.Interfaces;
using Tnf.Architecture.Dto.Registration;
using System.Linq;
using Tnf.Architecture.Domain.Registration;
using Tnf.Dto.Response;
using Tnf.Dto.Request;

namespace Tnf.Architecture.Application.Tests.Services
{
    public class SpecialtyAppServiceTests : TnfEfCoreIntegratedTestBase<EfCoreAppTestModule>
    {
        private readonly ISpecialtyAppService _specialtyAppService;
        private readonly SpecialtyPoco _specialtyPoco;

        public SpecialtyAppServiceTests()
        {
            _specialtyAppService = Resolve<ISpecialtyAppService>();

            _specialtyPoco = new SpecialtyPoco()
            {
                Id = 1,
                Description = "Anestesiologia"
            };

            // Setup
            UsingDbContext<LegacyDbContext>(context => context.Specialties.Add(_specialtyPoco));
        }

        [Fact]
        public void Should_Get_All_Specialties_With_Success()
        {
            //Act
            var count = _specialtyAppService.GetAllSpecialties(new GetAllSpecialtiesDto() { PageSize = 10 });

            //Assert
            count.Total.ShouldBe(1);
        }

        [Fact]
        public void Should_Insert_Specialty_With_Success()
        {
            //Arrange
            var specialtyDto = new SpecialtyDto()
            {
                Id = 2,
                Description = "Cirurgia Geral"
            };

            //Act
            var result = _specialtyAppService.CreateSpecialty(specialtyDto);

            //Assert
            result.Success.ShouldBeTrue();
            Assert.IsType(typeof(SpecialtyDto), result);
            (result as SpecialtyDto).Id.ShouldBe(2);
        }

        [Fact]
        public void Should_Insert_Specialty_With_Error()
        {
            // Act
            var response = _specialtyAppService.CreateSpecialty(new SpecialtyDto());

            // Assert
            Assert.False(response.Success);
            Assert.IsType(typeof(ErrorResponseDto), response);
            var errorResponse = response as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Specialty.Error.SpecialtyDescriptionMustHaveValue.ToString()));
        }

        [Fact]
        public void Should_Update_Specialty_With_Success()
        {
            //Arrange
            var specialtyDto = new SpecialtyDto()
            {
                Id = 2,
                Description = "Cirurgia Geral"
            };

            //Act
            var result = _specialtyAppService.CreateSpecialty(specialtyDto);

            //Assert
            result.Success.ShouldBeTrue();
            Assert.IsType(typeof(SpecialtyDto), result);
            var specialty = result as SpecialtyDto;

            specialty.Id.ShouldBe(2);

            specialty.Description = "Cirurgia Vascular";

            result = _specialtyAppService.UpdateSpecialty(specialty);

            //Assert
            result.Success.ShouldBeTrue();
            Assert.IsType(typeof(SpecialtyDto), result);
            specialty = result as SpecialtyDto;
            specialty.Description.ShouldBe("Cirurgia Vascular");
        }

        [Fact]
        public void Should_Update_Specialty_With_Error()
        {
            // Arrange
            var specialtyDto = new SpecialtyDto()
            {
                Id = 99,
                Description = "Cirurgia Geral"
            };

            //Act
            var response = _specialtyAppService.UpdateSpecialty(specialtyDto);

            // Assert
            Assert.False(response.Success);
            Assert.IsType(typeof(ErrorResponseDto), response);
            var errorResponse = response as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Specialty.Error.CouldNotFindSpecialty.ToString()));
        }

        [Fact]
        public void Should_Get_Specialty_With_Success()
        {
            //Act
            var result = _specialtyAppService.GetSpecialty(new RequestDto<int>(1));

            //Assert
            result.Id.ShouldBe(1);
            result.Description.ShouldBe(_specialtyPoco.Description);
        }

        [Fact]
        public void Should_Get_Specialty_With_Error()
        {
            // Act
            var result = _specialtyAppService.GetSpecialty(new RequestDto<int>(99));

            // Assert
            result.ShouldBeNull();
        }

        [Fact]
        public void Should_Delete_Specialty_With_Success()
        {
            //Arrange
            var specialtyDto = new SpecialtyDto()
            {
                Id = 2,
                Description = "Cirurgia Geral"
            };

            //Act
            var result = _specialtyAppService.CreateSpecialty(specialtyDto);

            //Assert
            result.Success.ShouldBeTrue();
            Assert.IsType(typeof(SpecialtyDto), result);
            (result as SpecialtyDto).Id.ShouldBe(2);

            //Act
            var response = _specialtyAppService.DeleteSpecialty(2);

            //Assert
            Assert.True(response.Success);
        }

        [Fact]
        public void Should_Delete_Specialty_With_Error()
        {
            // Act
            var response = _specialtyAppService.DeleteSpecialty(99);

            // Assert
            Assert.False(response.Success);
            Assert.IsType(typeof(ErrorResponseDto), response);
            var errorResponse = response as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Specialty.Error.CouldNotFindSpecialty.ToString()));
        }
    }
}
