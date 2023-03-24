import 'dart:io';

import 'setter.dart';

class AppNameSetter implements Setter {
  String _gradleFilePath = "./android/app/build.gradle";
  String _xcFilePath = "./ios/Runner.xcodeproj/project.pbxproj";
  String PATH_MANIFEST = 'android/app/src/main/AndroidManifest.xml';
  String PATH_MANIFEST_DEBUG = 'android/app/src/debug/AndroidManifest.xml';
  String PATH_MANIFEST_PROFILE = 'android/app/src/profile/AndroidManifest.xml';

  final String newAppName;

  AppNameSetter(this.newAppName);

  @override
  apply() {
    _gradleFile();
    _xcFile();
    _menifestFile();
  }

  _menifestFile() {
    _changeMainfAppName(PATH_MANIFEST);
    _changeMainfAppName(PATH_MANIFEST_DEBUG);
    _changeMainfAppName(PATH_MANIFEST_PROFILE);
  }

  Future<File?> _changeMainfAppName(String path) async {
    File meniFile = File(path);
    List? contentLineByLine = await meniFile.readAsLines();
    for (var i = 0; i < contentLineByLine.length; i++) {
      if (contentLineByLine[i].contains('android:label=')) {
        contentLineByLine[i] = '        android:label=\"$newAppName\"';
        break;
      }
    }
    await meniFile.writeAsString(contentLineByLine.join('\n'));
  }

  _gradleFile() {
    File gradleFile = File(_gradleFilePath);
    gradleFile.writeAsStringSync(
        gradleFile.readAsStringSync().replaceAll("Starter", newAppName));
    print("Done with android/app/build.gradle");
  }

  _xcFile() {
    File gradleFile = File(_xcFilePath);
    gradleFile.writeAsStringSync(gradleFile.readAsStringSync().replaceAll(
        'APP_DISPLAY_NAME = "Runner', 'APP_DISPLAY_NAME = "$newAppName'));
    gradleFile.writeAsStringSync(gradleFile.readAsStringSync().replaceAll(
        'APP_DISPLAY_NAME = Runner', 'APP_DISPLAY_NAME = $newAppName'));
    print("Done with ios/Runner.xcodeproj");
  }
}
