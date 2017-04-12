﻿using Tnf.Architecture.CrossCutting;
using Tnf.AspNetCore.AspNetCore.Mvc.Controllers;

namespace Tnf.Architecture.Web.Controllers
{
    public class ArchitectureControllerBase : TnfController
    {
        protected ArchitectureControllerBase()
        {
            LocalizationSourceName = AppConsts.LocalizationSourceName;
        }
    }
}