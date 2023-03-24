import 'dart:io';

import 'setter.dart';

class PackageNameSetter implements Setter {
  String _gradleFilePath = "./android/app/build.gradle";
  String _xcFilePath = "./ios/Runner.xcodeproj/project.pbxproj";
  String PATH_MANIFEST = 'android/app/src/main/AndroidManifest.xml';
  String PATH_MANIFEST_DEBUG = 'android/app/src/debug/AndroidManifest.xml';
  String PATH_MANIFEST_PROFILE = 'android/app/src/profile/AndroidManifest.xml';

  final String newPackageName;

  PackageNameSetter(this.newPackageName);

  @override
  apply() {
    _gradleFile();
    _xcFile();
    _menifestFile();
  }

  _menifestFile() {
    var mText = 'package="$newPackageName">';
    var mRegex = '(package.*)';
    _replaceInFileRegex(PATH_MANIFEST, mRegex, mText);
    _replaceInFileRegex(PATH_MANIFEST_DEBUG, mRegex, mText);
    _replaceInFileRegex(PATH_MANIFEST_PROFILE, mRegex, mText);
  }

  Future<void> _replaceInFileRegex(String path, regex, replacement) async {
    File meniFile = File(path);
    print(meniFile);
    String? contents = meniFile.readAsStringSync();
    contents = contents.replaceAll(RegExp(regex), replacement);
    await meniFile.writeAsString(contents);
  }

  _gradleFile() {
    File gradleFile = File(_gradleFilePath);
    gradleFile.writeAsStringSync(gradleFile
        .readAsStringSync()
        .replaceAll("com.starter.app", newPackageName));
    print("Done with android/app/build.gradle");
  }

  _xcFile() {
    File gradleFile = File(_xcFilePath);
    gradleFile.writeAsStringSync(gradleFile
        .readAsStringSync()
        .replaceAll("com.starter.app", newPackageName));
    print("Done with ios/Runner.xcodeproj");
  }
}
