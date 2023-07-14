import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/annotated_region.dart';
import '../../../widgets/button_default.dart';
import 'backup_controller.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotedAppRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BACKUP/RESTORE"),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 16, bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Backup & Download"),
                      Consumer(
                        builder: (context, ref, child) {
                          return ButtonDefault(
                            text: "SUBMIT",
                            onTap: () async {
                              EasyLoading.showInfo("Wait");
                              await ref
                                  .watch(backupProvider.future)
                                  .then((value) {
                                if (value == true) {
                                  EasyLoading.dismiss();
                                  EasyLoading.showToast("Successfull");
                                } else {
                                  EasyLoading.dismiss();
                                  EasyLoading.showToast("Failed");
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
