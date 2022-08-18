import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx6_7/todolistApp/controller/todolist_controller.dart';
import 'package:getx6_7/todolistApp/models/todoapp_model.dart';
import 'package:getx6_7/todolistApp/screens/edit_sceen.dart';
import 'package:intl/intl.dart';

final datformatString =
    DateFormat('dd-MM-yyyy').parse(DateTime.now().toString());

class HomeTodoApp extends StatefulWidget {
  HomeTodoApp({Key? key}) : super(key: key);

  @override
  State<HomeTodoApp> createState() => _HomeTodoAppState();
}

class _HomeTodoAppState extends State<HomeTodoApp> {
  final TodoTaskController todoTaskController = Get.put(TodoTaskController());
  TextEditingController taskController = TextEditingController();

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
            child: GetBuilder<TodoTaskController>(
              builder: ((controller) => ListView.builder(
                    itemCount: todoTaskController.listTask.length,
                    itemBuilder: (context, index) {
                      var item = todoTaskController.listTask[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => EditTaskScreen(todoTask: item));
                        },
                        child: Card(
                          color: item.check == true
                              ? const Color.fromARGB(255, 239, 191, 187)
                              : null,
                          elevation: 0,
                          child: ListTile(
                            leading: Checkbox(
                                value: item.check,
                                onChanged: (value) {
                                  setState(() {
                                    item.check = value!;
                                  });
                                }),
                            title: Text(item.title,
                                style: const TextStyle(fontSize: 20)),
                            subtitle: Text(item.date),
                            trailing: IconButton(
                                onPressed: () async {
                                  await todoTaskController.deleteTask(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await todoTaskController.addTask(TodoTask(
              id: Random().nextInt(100),
              title: taskController.text,
              check: false,
              date: DateTime.now().toString().substring(0, 10)));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
