import 'package:flutter/material.dart';
import 'package:flutter_application/application.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/widgets/design_system/app_typography.dart';

class DialogUtils {
  static void showDialogConfirm({required BuildContext context, required String message, VoidCallback? onOk}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message,
                    style: AppTypography.title,
                  ),
                  kSpacingItem4,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onOk?.call();
                        },
                        child: const Text("Ok"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
