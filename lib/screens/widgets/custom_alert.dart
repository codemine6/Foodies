import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Ionicons.alert_circle_outline,
        size: 56,
        color: Colors.red,
      ),
      title: const Text('Something went wrong.'),
      content: Text(
        'Check your internet connection!',
        style: TextStyle(color: Theme.of(context).disabledColor),
        textAlign: TextAlign.center,
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).canvasColor,
          ),
          child: const Text('Ok'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
