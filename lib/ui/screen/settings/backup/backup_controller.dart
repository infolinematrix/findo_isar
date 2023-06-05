import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../services/isar_database.dart';
import '../../../../util/functions.dart';

final backupProvider = FutureProvider.autoDispose<bool>((ref) async {
  Directory directory;

  try {
    if (Platform.isAndroid) {
      if (await getStoragePermission()) {
        directory = (await getExternalStorageDirectory())!;
        // directory = (await getDownloadsDirectory())!;
        String newPath = "";
        List<String> paths = directory.path.split("/");

        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/Findo";
        directory = Directory(newPath);

        //--If Directory not exist, Create it
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }

        if (await directory.exists()) {
          String filename = timeStampToFilename();

          await IsarHelper.instance.db!
              .copyToFile("${directory.path}/$filename")
              .then((value) => value);
        }
      } else {
        return false;
      }
    }

    return true;
  } catch (e) {
    rethrow;
  }
});

//--READ
// Future readData(File file) async {
//   try {
//     final contents = await file.readAsString();
//     return contents;
//   } catch (e) {
//     return null;
//   }
// }

//--WRITE
// Future<File> writeData() async {
//   final Directory appDocDir = await getApplicationDocumentsDirectory();
//   final String appDocPath = appDocDir.path;
//   try {
//     if (Isar.instanceNames.isNotEmpty) {
//       if (await File('$appDocPath/backup.data').exists() == true) {
//         await File('$appDocPath/backup.data').delete();
//       }
//       await IsarHelper.instance.db!
//           .copyToFile('$appDocPath/backup.data')
//           .then((value) => value);
//     }

//     //---- SAVE TO
//     final file = File('$appDocPath/findo_backup.data');
//     file.writeAsString('$appDocPath/backup.data');

//     return file;
//   } catch (e) {
//     rethrow;
//   }
// }

//-- STORAGE PERMISSION
Future getStoragePermission() async {
  PermissionStatus status = await Permission.storage.request();
  //PermissionStatus status1 = await Permission.accessMediaLocation.request();
  PermissionStatus status2 = await Permission.manageExternalStorage.request();
  // print('status $status   -> $status2');

  //--
  if (status.isGranted && status2.isGranted) {
    return true;
  } else if (status.isPermanentlyDenied || status2.isPermanentlyDenied) {
    await openAppSettings();
  } else if (status.isDenied) {
    // print('Permission Denied');
  }

  return false;
}
