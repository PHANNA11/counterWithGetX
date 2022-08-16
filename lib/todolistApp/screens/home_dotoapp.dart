import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx6_7/todolistApp/models/todoapp_model.dart';
import 'package:intl/intl.dart';

final datformatString =
    DateFormat('dd-MM-yyyy').parse(DateTime.now().toString());

class HomeTodoApp extends StatefulWidget {
  HomeTodoApp({Key? key}) : super(key: key);

  @override
  State<HomeTodoApp> createState() => _HomeTodoAppState();
}

class _HomeTodoAppState extends State<HomeTodoApp> {
  TextEditingController taskController = TextEditingController();
  List<TodoTask> list = [
    TodoTask(
        title: 'write code', check: false, date: DateTime.now().toString()),
    TodoTask(title: 'HTML code', check: true, date: DateTime.now().toString()),
    TodoTask(title: 'JAVA code', check: false, date: DateTime.now().toString())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
            ),
            title: Text(
              'My Tasks',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('2 of 7 tasks'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                  label: Text('todo task'),
                  hintText: 'task name',
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];
                return ListTile(
                  leading: Checkbox(
                      value: item.check,
                      onChanged: (value) {
                        setState(() {
                          item.check = value!;
                        });
                      }),
                  title: Text(item.title, style: const TextStyle(fontSize: 20)),
                  subtitle: Text(item.date),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add(TodoTask(
                title: taskController.text,
                check: false,
                date: DateTime.now().toString()));
          });
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
