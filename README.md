# Flutter starter app with MVVM stacked architecture and RxDart 

## Setup

### Change AppName and Package Name in pubspec.yaml
```bash
flutter clean
flutter pub get
flutter pub run change_app_package_name:main com.new.package.name
flutter pub get
```
### Note: After Project Configured Remove setup Folder


## build release

###Dev: 
`flutter build apk --release --flavor dev -t lib/main_dev.dart`

###Prod: 
`flutter build apk --release --flavor prod -t lib/main_prod.dart`

###AppBundle:
`flutter build appbundle --release --flavor prod -t lib/main_prod.dart`


## Build Runner Build

`flutter packages pub run build_runner build --delete-conflicting-outputs`