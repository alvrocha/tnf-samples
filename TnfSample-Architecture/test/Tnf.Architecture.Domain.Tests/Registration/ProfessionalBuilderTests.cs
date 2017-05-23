﻿using Tnf.Architecture.Domain.Registration;
using Tnf.Architecture.Dto.ValueObjects;
using Xunit;
using System.Linq;
using Tnf.Dto.Response;

namespace Tnf.Architecture.Domain.Tests.Registration
{
    public class ProfessionalBuilderTests
    {
        [Fact]
        public void Create_Valid_Professional()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", "123", "APT 1", new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.True(build.Success);
        }

        [Fact]
        public void Create_Professional_With_Invalid_Name()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName(null)
                  .WithAddress("Rua do comercio", "123", "APT 1", new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalNameMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_ZipCode()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", "123", "APT 1", new ZipCode(null))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalZipCodeMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_Address()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress(null, "123", "APT 1", new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalAddressMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_Address_Number()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", null, "APT 1", new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalAddressNumberMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_Address_Complement()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", "123", null, new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalAddressComplementMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_Phone()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", "123", "APT 1", new ZipCode("12345678"))
                  .WithEmail("professional@professional.com")
                  .WithPhone(null);

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalPhoneMustHaveValue.ToString()));
        }

        [Fact]
        public void Create_Professional_With_Invalid_Email()
        {
            // Arrange
            var builder = new ProfessionalBuilder()
                  .WithName("Professional 1")
                  .WithAddress("Rua do comercio", "123", "APT 1", new ZipCode("12345678"))
                  .WithEmail(null)
                  .WithPhone("5563524178");

            // Act
            var build = builder.Build();

            // Assert
            Assert.False(build.Success);
            Assert.IsType(typeof(ErrorResponseDto), build);
            var errorResponse = build as ErrorResponseDto;
            Assert.True(errorResponse.Notifications.Any(a => a.Message == Professional.Error.ProfessionalEmailMustHaveValue.ToString()));
        }
    }
}
