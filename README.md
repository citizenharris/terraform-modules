# Example Terraform project scaffold

## Overview

This is an example of how to structure a Terraform project

## Structure overview

The idea behind this scaffold is that commonly used resources follow a template
and are exposed as modules. This helps with reusability as well as enforcing
naming standards.

In the application folder, the commonly used resources are orchestrated together
where it is packaged together and exposed as a module.

Finally, in the deployment folder the app, as a packaged module, is instantiated
with environment specific variables ready to be deployed.

See below for a diagram with example common modules and applications.

```shell
.
├── application
│   ├── weather_forecast_api
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── joke_generator_api
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── common_modules
│   └── azure
│       ├── group
│       │   └── resource_group
│       │       ├── main.tf
│       │       ├── outputs.tf
│       │       └── variables.tf
│       └── web
│           ├── app_service
│           │   ├── main.tf
│           │   ├── outputs.tf
│           │   └── variables.tf
│           └── app_service_plan
│               ├── main.tf
│               ├── outputs.tf
│               └── variables.tf
└── environments
    └── production
        └── apps
            ├── weather_forecast_api
            │   ├── main.tf
            │   └── variables.tf
            ├── joke_generator_api
            │   └── main.tf
            └── ...
```
