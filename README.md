# Flutter architecture template

## Introduction

This project is a starting point for a Flutter applications created by Worldline Spain.

## Features

- Clean Architecture
- Flavors (dev, prep, prod)
- Http client to Api REST ([Dio](https://pub.dev/packages/dio))
- Native launch screen
- App icons configured
- Internationalization translations ([Easy localization](https://pub.dev/packages/easy_localization))
- Routing ([Go Router](https://pub.dev/packages/go_router))
- MVVM pattern with [Cubit](https://pub.dev/packages/flutter_bloc) for state management
- Dependency injection ([Get it](https://pub.dev/packages/get_it) and [Injectable](https://pub.dev/packages/injectable)).

## Environment

The application has three environments and each one has its own configuration file:

- dev: `.env/dev.dart`
- prep: `.env/prep.dart`
- prod: `.env/prod.dart`

## Configure new project

To configure a new project, you have change the following files:

1. The environment files with the key and values.
2. Replace the project name `worldline_flutter` in all files.
3. Replace the package name `com.worldline.flutter` in all files.
4. Remove all files with references to Example code.
5. Refactor homeWorldline on `constants.dart`
6. Rename folder on `android/app/src/main/kotlin/` to your package name

### Generate native splash

1. Replace the splash image `assets/images/splash-logo.png` with the new one.
2. Replace the splash android 12 image `assets/images/splash-android12-logo.png` with the new one.
3. Generate the splash images with the following command `fvm flutter pub run flutter_native_splash:create`
4. (optional) If you want use splash images in Flutter, replace the `assets/images/splash.png` and related images to accomplish the [resolution aware asset](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).
In your `android/app/src/main/res/drawable-mdpi` folder, you will have a `splash.png`.
This is your 1x image. [reference](https://developer.android.com/training/multiscreen/screendensities)
Copy that to your app's assets folder. Then copy the `splash.png` in `android/app/src/main/res/drawable-hdpi` to a subfolder in your app's assets folder named `1.5x`. Do the same for the rest of the folders. The mapping should be:

- `mdpi` → `assets`
- `hdpi` → `assets/1.5x`
- `xhdpi` → `assets/2.0x`
- `xxhdpi` → `assets/3.0x`
- `xxxhdpi` → `assets/4.0x`

## Run and build

To run the application in each environment, you can use the following commands:

- dev: `flutter run --flavor dev --dart-define-from-file=.env/dev.json`
- prep: `flutter run --flavor prep --dart-define-from-file=.env/prep.json`
- prod: `flutter run --flavor prod --dart-define-from-file=.env/prod.json`

Also, you can configure your IDE to run the application in each environment.

## Generate code

If you implement a new injectable file, you have to run the following command to generate the necessary code:

`fvm flutter packages pub run build_runner build` or `sh ./tool/generate_code.sh`

Also, you can configure Android Studio to run this command automatically:

1. On the configuration, add a new "External tool" execution step in the "before launch" section.
2. Configure the execution step as follows:
   1. Name: injectable
   2. Description: Run injects before launch
   3. Program: flutter
   4. Arguments: packages pub run build_runner build
   5. Working directory: $ProjectFileDir$

Is important to note that you have to configure the command for the three flavors.
