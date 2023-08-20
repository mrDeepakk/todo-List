import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_list/resource/database.dart';

// ignore: must_be_immutable
class ToDotile extends StatelessWidget {
  final String text;
  bool isDark = false;
  DataBase db = DataBase();
  Function(BuildContext) deleteTask;
  final bool taskCompleted;
  Function(bool?)? onChange;
  ToDotile(
      {super.key,
      required this.text,
      required this.taskCompleted,
      required this.onChange,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              onPressed: deleteTask,
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(20),
              onPressed: deleteTask,
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
          // height: 70,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChange,
                activeColor: Colors.black,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
