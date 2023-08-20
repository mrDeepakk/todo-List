import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_list/resource/database.dart';
import 'package:task_list/widgets/dilogBox.dart';
import 'package:task_list/widgets/todotile.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box("MyBox");
  final _controller = TextEditingController();
  DataBase db = DataBase();
  bool isDark = true;
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    // TODO: implement initState
    // db.initDataBase();
    if ((_myBox.get("todolist")) != null) {
      db.loadData();
    } else {
      db.toDolist.add(["Add new task", false]);
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(255, 0, 15, 102) : Colors.white70,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                isDark = !isDark;
                setState(() {});
              },
              color: isDark ? Colors.white70 : Colors.black,
              icon: const Icon(
                Icons.dark_mode_rounded,
                size: 40,
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor:
            isDark ? const Color.fromARGB(255, 0, 15, 102) : Colors.blue,
        title: Text(
          'All task',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDotile(
            text: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChange: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => {deleteTask(index)},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDark ? Colors.cyanAccent : Colors.deepOrange,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DilogBog(
                controller: _controller,
                onSave: saveTask,
                onCancel: () {
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
