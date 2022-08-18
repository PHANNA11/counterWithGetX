import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx6_7/todolistApp/models/todoapp_model.dart';

class TodoTaskController extends GetxController {
  List<TodoTask> listTask = <TodoTask>[].obs();
  addTask(TodoTask todoTask) async {
    listTask.add(todoTask);
    update();
  }

  updateTask(TodoTask todoTask) async {
    listTask[listTask.indexWhere((element) => element.id == todoTask.id)] =
        todoTask;
    update();
  }

  deleteTask(int index) async {
    listTask.removeAt(index);
    update();
  }
}
