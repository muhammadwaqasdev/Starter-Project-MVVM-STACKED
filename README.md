# Flutter starter app with MVVM stacked architecture and RxDart 

## Setup

### Change AppName and Package Name in pubspec.yaml
```bash
flutter clean
flutter pub get
flutter pub run package_rename:set
dart setup/setup.dart --dartBundleName="starter_app"
flutter pub get
```

## build releasse

###Dev: `flutter build apk --release --flavor dev -t lib/main_dev.dart`

###Prod: `flutter build apk --release --flavor prod -t lib/main_prod.dart`

## Build Runner Build

`flutter packages pub run build_runner build`