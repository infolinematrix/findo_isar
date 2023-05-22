import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallet/services/isar_database.dart';
import 'package:isar/isar.dart';

final backupProvider = FutureProvider.autoDispose((ref) async {
  try {
    // final dir = await getApplicationDocumentsDirectory();
    // final extDirecetory = await getExternalStorageDirectory();
    // final dirPath = '${extDirecetory.path}/some_name' ;
    //    await Directory(dirPath).create();

    Directory generalDownloadDir = Directory('/storage/emulated/0/Findo/');
    if ((await Directory(generalDownloadDir.toString()).exists() == false)) {
      Directory(generalDownloadDir.toString()).create();
    }

    String filePath = "${generalDownloadDir.path}/data.isar";

    // if ((await File(filePath).exists() == true)) {
    //   await File(filePath).delete();
    // }

    if (Isar.instanceNames.isNotEmpty) {
      if (await File(filePath).exists() == true) {
        await File(filePath).delete();
      } else {
        await File(filePath).create();
      }
      await IsarHelper.instance.db!.copyToFile(filePath);
    }
    return;
  } catch (e) {
    print(e.toString());
    rethrow;
  }
});



// Future<void> restore({required File file}) async {
//     print('common restore ${file.path}');
//     isar = await Isar.open([
//       ExampleSchema1,
//       ExampleSchema2,
//     ], name: basename(file.path), inspector: true, directory: file.path);
//   }

// uploadFileToGoogleDrive() async {  
//    var client = GoogleHttpClient(await googleSignInAccount.authHeaders);  
//    var drive = ga.DriveApi(client);  
//    ga.File fileToUpload = ga.File();  
//    var file = await FilePicker.getFile();  
//    fileToUpload.parents = ["appDataFolder"];  
//    fileToUpload.name = path.basename(file.absolute.path);  
//    var response = await drive.files.create(  
//      fileToUpload,  
//      uploadMedia: ga.Media(file.openRead(), file.lengthSync()),  
//    );  
//    print(response);  
//  } 

// Future<void> downloadGoogleDriveFile(String fName, String gdID) async {  
//    var client = GoogleHttpClient(await googleSignInAccount.authHeaders);  
//    var drive = ga.DriveApi(client);  
//    ga.Media file = await drive.files  
//        .get(gdID, downloadOptions: ga.DownloadOptions.FullMedia);  
//    print(file.stream);  
   
//    final directory = await getExternalStorageDirectory();  
//    print(directory.path);  
//    final saveFile = File('${directory.path}/${new DateTime.now().millisecondsSinceEpoch}$fName');  
//    List<int> dataStore = [];  
//    file.stream.listen((data) {  
//      print("DataReceived: ${data.length}");  
//      dataStore.insertAll(dataStore.length, data);  
//    }, onDone: () {  
//      print("Task Done");  
//      saveFile.writeAsBytes(dataStore);  
//      print("File saved at ${saveFile.path}");  
//    }, onError: (error) {  
//      print("Some Error");  
//    });  
//  } 


