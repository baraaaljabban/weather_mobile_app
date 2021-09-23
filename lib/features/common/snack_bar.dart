import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class SnackBarHelper {
  static void showLoadingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(
          const SnackBar(
            content: LoadingIndicator(),
            backgroundColor: Colors.transparent,
            duration: Duration(days: 1),
          ),
        )
        .closed
        .then((reason) {
      if (reason == SnackBarClosedReason.swipe) showLoadingSnackBar(context);
    });
  }

  static void showErrorSnackBar(BuildContext context, {String? message, void Function()? callBack}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            children: [
              Text(message ?? ""),
              IconButton(
                onPressed: () => callBack!.call(),
                icon: const Icon(
                  Icons.refresh_outlined,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 20),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 10),
      ),
    );
  }

  static void showWarningSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ""),
        backgroundColor: Colors.orange,
        duration: const Duration(
          seconds: 18,
        ),
      ),
    );
  }
}
