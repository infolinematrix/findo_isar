import 'package:flutter/material.dart';

// AlertAction? action = await confirmDialog(context,
//     "WARNING\nYou want delete transaction. \nYou will loose all the transaction happend on this account.");

// if (action == AlertAction.ok) {
//   await ref
//       .read(accountProvider(parent.id).notifier)
//       .delete(parentId: parent.id, id: account.id)
//       .then((value) {
//     if (value == true) {
//       EasyLoading.showSuccess("Success");
//     }
//   });
// }

enum AlertAction { cancel, ok }

Future<AlertAction?> confirmDialog(BuildContext context, String message) async {
  return showDialog<AlertAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Row(
          children: [
            Text('Confirm!',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
            const Spacer(),
            Icon(
              Icons.info,
              size: 25,
              color: Theme.of(context).disabledColor,
            ),
          ],
        ),
        content: Text(
          message.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(AlertAction.cancel);
            },
            child: const Text(
              "CANCEL",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(AlertAction.ok);
            },
            child: const Text(
              "OK",
            ),
          ),
        ],
      );
    },
  );
}
