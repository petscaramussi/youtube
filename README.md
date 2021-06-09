## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
For help getting started with Flutter, view our online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Install
First of all clone the repository with

gh repo clone petscaramussi/lista_tarefas
Run app

after configure your emulator

flutter emulator
start debugging and run

flutter run

## youtube
 youtube clone, with back-end using Youtube API
 
 
## resources

### Using API

Pubspec.yaml:

```
dependencies:
  flutter:
    sdk: flutter

  http: ^0.12.0+2
  flutter_youtube: ^1.1.6
```

File:

```
import 'package:http/http.dart' as http;
import 'dart:convert';


// use your api key here
const CHAVE_YOUTUBE_API = "";

// api url base
const URL_BASE = "https://youtube.googleapis.com/youtube/v3/";
```
