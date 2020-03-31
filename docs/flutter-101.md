# Flutter 101

## Introduction
A guideline to kick start your flutter development locally.

## Prerequisite
- Visual Studio Code
- Basic concept of Flutter
- Dart
- Access to https://pub.dartlang.org from BISON
- Access to https://storage.googleapis.com/pub-packages/packages from BISON
- Git
- Android SDK
- Android Emulator

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
| static/images 	| This folder contains all the images that are used in the mobile application. 	|

## Setting Up Development Environment
### STEP 1: Download Project
- Create a folder named `Excercise`
- Open the folder you had created with Visual Studio Code.
- Execute `git init`.
- Execute `git clone <<Replace with G.... Repository>> .` at your Visual Studio Code's terminal.

### STEP 2: Create Your Local Branch
- Create a local branch by execute `git checkout -b exe-flutter-yourname`.
- To check your current branch, execute `git status`.

### STEP 3: Navigate to Your Working Directory ( flutter-template )
- Now change your directory to `flutter/flutter-template`.

### STEP 4: Create appsettings.local.json
- Create a new file with file name as `appsettings.local.json`.
- Open the file and insert `{}` as the content of the file.
- Save the file.

### STEP 5: Run the app
- Start the Android Emulator from Android Studio.
- Now click on _F5_ key to run the mobile app.


## Create our First Screen
### STEP 1: Create A Screen Widget

1. Create a dart file name **'new_screen'** at _lib/features/main_.
2. Add the code structure below to your new_screen.dart file:
    ```dart
    import 'package:flutter/material.dart';

    class NewScreen extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: Center(
                    child: Text('This is my new screen!'),
                ),
            );
        }
    }

    ```
3. Register the new screen's route at _lib/infrastructure/router.js_
    ```dart
    import ...;
    import ...;
    import ...;
    import 'package:flutter_template/features/main/new_screen.dart'; // Import your new screen

    class Router {
        static const String initialScreenRoute = '/';
        static const String homeScreenRoute = '/home';
        static const String recordSummaryScreenRoute = '/recordSummary';
        static const String newScreenRoute = '/new'; // Assign a route to the new screen

        static Route<dynamic> generateRoute(RouteSettings settings) {
            switch (settings.name) {
            case ...:
                ...
            case ...:
                ...
            case initialScreenRoute: // Move this case from top to here
            case newScreenRoute: // Register new route
                return MaterialPageRoute(
                    builder: (BuildContext context) => NewScreen(),
                );
            default:
                ...
            }
        }
    }
    ```
4. Save all your changes and restart debugging session by using shortcut key `ctrl+shift+f5`.

### STEP 2: Create A Component Widget
1. Create a dart file name **'new_screen_content'** at _lib/features/main/component_.
2. Add the code structure below to your new_screen_content.dart.
    ```dart
    import 'package:flutter/material.dart';

    class NewScreenContent extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Container(
                height: 100,
                alignment: Alignment.center,
                child: Text('This is my new screen content component!'),
            );
        }
    }

    ```
3. Save the file.

### STEP 3: Apply Component Widget to Screen
Now, we need this table to show at our new_screen.dart.
1. Import your component widget at new_screen.dart.
    ```dart
    import ...
    import 'package:flutter_template/features/main/component/new_screen_content.dart';
    ```
2. Replace text widget in new_screen.dart with the NewScreenContent widget.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_template/features/main/component/new_screen_content.dart';

    class NewScreen extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: Center(
                    child: NewScreenContent(), // Update this line
                ),
            );
        }
    }
    ```
4. Save all your changes (Auto hot reload will happen) and you will see the new component being used in your NewScreen. 

### STEP 4: Create View Model for A Screen
Now we want to make the text of the NewScreenContent updated when clicking on a button.

1. Create a dart file name **'new_screen_view_model'** in _lib/infrastructure/viewmodel/main_.
2. Add the code structure below to your new_screen_view_model.dart:
    ```dart
    import 'package:flutter/material.dart';

    class NewScreenViewModel with ChangeNotifier {
        String text = 'I am original text.';

        void updateText() {
            text = 'I am updated text';
            notifyListeners();
        }
    }
    ```
3. Register new view model in locator.dart setupLocator function.
    ```dart
    Future<void> setupLocator(AppSettings appSettings) async {
        
        ...

        locator.registerFactory(() => NewScreenViewModel());
    }
    ```
4. Wrap NewScreen with ChangeNotifierProvider&lt;NewScreenViewModel&gt;:
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_template/features/main/component/new_screen_content.dart';
    import 'package:flutter_template/infrastructure/viewmodel/main/new_screen_view_model.dart';
    import 'package:flutter_template/infrastructure/locator.dart'; // Impoer locator
    import 'package:flutter_template/infrastructure/viewmodel/main/new_screen_view_model.dart'; // Import NewScreenViewModel
    import 'package:provider/provider.dart'; // Import provider

    class NewScreen extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            NewScreenViewModel newScreenViewModel = locator.get(); // Get view model from locator
            return ChangeNotifierProvider<NewScreenViewModel>( // Wrap entire Scaffold with ChangeNotifierProvider
                create: (_) => newScreenViewModel,
                child: Scaffold(
                        body: Center(
                        child: NewScreenContent(),
                    ),
                ),
            );
        }
    }

    ```
5. Create a button which will be clicked to change the text of NewScreenContent:
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_template/features/main/component/new_screen_content.dart';
    import 'package:flutter_template/infrastructure/locator.dart';
    import 'package:flutter_template/infrastructure/viewmodel/main/new_screen_view_model.dart';
    import 'package:provider/provider.dart';

    class NewScreen extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            NewScreenViewModel newScreenViewModel = locator.get();
            return ChangeNotifierProvider<NewScreenViewModel>(
                create: (_) => newScreenViewModel,
                child: Scaffold(
                    body: Center(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                NewScreenContent(),
                                RaisedButton(
                                    onPressed: newScreenViewModel.updateText,
                                    child: Text('Update text'),
                                ),
                            ],
                        ),
                    ),
                ),
            );
        }
    }
    ```
6. Update NewScreenContent to get the text from view model.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_template/infrastructure/viewmodel/main/new_screen_view_model.dart';
    import 'package:provider/provider.dart'; // Import provider

    class NewScreenContent extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            NewScreenViewModel newScreenViewModel = Provider.of(context); // Get view model from provider
            return Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.grey,
                child: Text(newScreenViewModel.text), // Receive text from view model
            );
        }
    }
    ```
7. Save all your changes (Auto hot reload will happen).
8. Click on the button and the text will be updated.