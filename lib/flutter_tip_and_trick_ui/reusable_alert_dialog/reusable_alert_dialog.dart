import 'package:flutter/material.dart';

class AlertDialogModel<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;

  const AlertDialogModel(
      {required this.title, required this.message, required this.buttons});
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog<T?>(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: buttons.entries.map((entry) {
                return TextButton(
                  child: Text(
                    entry.key,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(entry.value);
                  },
                );
              }).toList());
        });
  }
}

class DeleteDialog extends AlertDialogModel<bool> {
  DeleteDialog({
    required String objName,
  }) : super(
            title: 'Delete $objName',
            message: 'Are you sure you want to delete this $objName?',
            buttons: {
              'CANCEL': false,
              'DELETE': true,
            });
}

Future<bool> displayDeleteDialog(BuildContext context) =>
    DeleteDialog(objName: 'comment')
        .present(context)
        .then((value) => value ?? false);
