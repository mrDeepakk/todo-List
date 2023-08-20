import 'package:flutter/material.dart';
import 'package:task_list/widgets/myButton.dart';

// ignore: must_be_immutable
class DilogBog extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final controller;

  DilogBog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: MediaQuery.of(context).size.height / 6.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.deepOrange,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 21),
                hintText: "Add a new task",
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
