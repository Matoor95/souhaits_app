import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onCancel;
  VoidCallback onAdded;
  AddDialog(
      {required this.controller,
      required this.onAdded,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(" Ajouter une list"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Entrer le nom de la list"
        ),
        

      ),
      actions: [
        TextButton(onPressed: onAdded, child: const Text("Valider")),
        TextButton(onPressed: onCancel, child: Text("Annuler"))
      ],
    );
  }
}
