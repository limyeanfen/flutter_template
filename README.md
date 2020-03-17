# flutter_template

A new Flutter project.

## Getting Started

### To Run

flutter run -t lib/program.dart


### How to invoke other environment's url from development
1. Ensure *appsettings.local.json* exists at the root of project. (If it does not, create it with `{}` as its content)<br/>
    **NOTE**: This step is necessary for pubspec.yaml to detect *appsettings.local.json* and prevent error when running the application.
2. Open command prompt.
3. Run the application by using the command in `flutter run -t lib/program.dart`.
4. After it runs successfully, open *appsettings.local.json* file from root of project.
5. Search for `baseUrl` key (create one it does not exists) and replace the value with other environment's url.<br/>
6. Focus on command prompt and press `R` to hot restart.