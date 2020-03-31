# Flutter 101

## Introduction
A Flutter documentation on some special development flow.

## Prerequisite
- Visual Studio Code
- Basic concept of Flutter
- Dart
- Access to https://pub.dartlang.org from BISON
- Access to https://storage.googleapis.com/pub-packages/packages from BISON
- Git
- Android SDK
- Android Emulator
- vscode-flutter-i18n-json Visual Studio Code plugin

## Folder structure

| Folder/File 	| Description 	|
|----------------------------------------	|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| .vscode/launch.json 	| - Launcher file specifically for Visual Studio Code. <br>- Required to assign program.dart as the entrypoint. 	|
| android 	| All the Android related files and code for the application. 	|
| i18n 	| This file contain message json files of different locale.  	|
| ios 	| All the iOS related files and code for the application. 	|
| lib/domain/i18n.dart 	| This is an auto generated file which contains all the messages to be used in the mobile application in different locale. 	|
| lib/features 	| This folder contains all the UI screens/components widget code. 	|
| lib/features/{feature}/component 	| This folder contains all the components that are used in the feature screens. 	|
| lib/features/app.dart 	| Root widget of the entire mobile application. 	|
| lib/infrastructure/repository 	| - This folder contains repository files which acts as a connector to get data.<br>- For http repository, prefix file with http, i.e. http_header_repository.dart.<br>- For static repository, prefix file with static, i.e. static_heep_repository.dart. 	|
| lib/infrastructure/viewmodel/{feature} 	| This folder contains all the view models for a specific feature 	|
| lib/infrastructure/locator.dart 	| This file handle inversion of control for view models. 	|
| lib/infrastructure/router.dart 	| This file contains the routes available in the entire mobile application. 	|
| lib/model 	| This folder contains all the  	|
| lib/seedwork 	| - This folder contains all the utilities or files that can be shared among different projects.<br>- It should have minimum to no changes. 	|
| lib/program.dart 	| Entry point of the application. 	|
| lib/startup.dart 	| This file handles setting up of locator before running the mobile application. 	|
| static/data 	| This folder contains all the data files, i.e. json files, used to create static repository. 	|
| static/fonts 	| This folder contains all the fonts that are used in the mobile application. 	|

## How to handle ORM in Flutter
Assuming we will be creating a model named **'user'**.
### STEP 1: Create a model in _lib/model_
- Create a dart file name **'user'** with the below code structure:
    ```dart
    import 'package:json_annotation/json_annotation.dart';

    part 'user.g.dart';

    @JsonSerializable()
    class User {

        User();

        String id;
        String name;
        String title;

        factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
        Map<String, dynamic> toJson() => _$UserToJson(this);
    }
    ```
### STEP 2: Run code generation utility (One time)
- Open terminal in Visual Studio Code.
- Run command below to re-generate all models.
    ```
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
- When it is done, each of the model that are annotated with JsonSerializable will be re-generated.

### (Optional) STEP 3: Run code generation utility (Continuously)
- Open terminal in Visual Studio Code.
- Run command below to generate and watch changes on project files to automatically build necessary files when needed.
    ```
    flutter pub run build_runner watch
    ```
When it is done, changes on model will automatically trigger regeneration.

### STEP 4: Usage of model
For anywhere that requires the use of conversion between Json to model or vice versa, developer can done it by:
```dart
    User.fromJson(<Pass in the Map<String, dynamic> here>); // Convert from Json to User model. Will return object of type User.
    User.toJson(); // Convert from User model to Json. Will return object of type Map<String, dynamic>

```

## How to handle i18n messages
Assuming that we will be converting a string "My name is {userName}", where userName is from a variable.

### STEP 1: Install Visual Studio Code plugin
Ensure that visual studio code plugin - vscode-flutter-i18n-json is installed.

### STEP 2: Update the message in default locale file
- The default locale file is in _i18n/en-US.json_.
- In en-US.json, add in a key named **''**

## How to create static repository
### STEP 1: Prepare json data.
### STEP 2: Create model for data to be read. 
### STEP 3: Create static repository class.
### STEP 4: Read data and initialize static repository in locator.
### STEP 5: Pass the repository as named parameter to view model that requires it. 

## How to create http repository
### STEP 1: Create http repository class.
### STEP 2: Extend http_repository