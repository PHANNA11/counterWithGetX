import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx6_7/todolistApp/models/todoapp_model.dart';

import '../controller/todolist_controller.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({required this.todoTask, Key? key}) : super(key: key);
  TodoTask todoTask;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TodoTaskController todoTaskController = Get.put(TodoTaskController());
  TextEditingController taskController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskController.text = widget.todoTask.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: taskController,
          decoration: const InputDecoration(
              label: Text('todo task'),
              hintText: 'task name',
              border: OutlineInputBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await todoTaskController.updateTask(TodoTask(
              id: widget.todoTask.id,
              title: taskController.text,
              check: widget.todoTask.check,
              date: widget.todoTask.date));
        },
        child: const Icon(
          Icons.done,
          size: 30,
        ),
      ),
    );
  }
}
