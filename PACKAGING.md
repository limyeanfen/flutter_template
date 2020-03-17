# Building and Packaging Flutter App

## Introduction
This documentation will describe the approach to build and package flutter mobile application for both iOS and Android.

## Prerequisite
- Dart
- Flutter
- Ruby (Fastlane)
- Android SDK

## Build and release an Android app
1. Open git bash.
2. Navigate into <project root>/android folder.
3. Run `bundle install` to install all the dependencies required.
4. Set the environment variable with appropriate value by running the following script:
    ```sh
    export BUILD_NAME=<Replace with appropriate build name in the format of x.y.z, i.e. 1.0.0>
    export BUILD_NUMBER=<Replace with appropriate build number, i.e. 1>
    export APK_OUTPUT_PATH=<Replce with targetted output path of apk, i.e. /output/release.apk>
    export APPSETTINGS_LOCAL_PATH=<Replace with the location of appsettings.local.json, i.e. /config/staging/appsettings.local.json> 
    ```
5. Run `bundle exec fastlane build` to build the apk.
6. After the build completed, the apk will be available in the output path stated in APK_OUTPUT_PATH environment variable.