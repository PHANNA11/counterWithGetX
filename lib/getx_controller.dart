import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  int counter = 0.obs();
  increment() {
    counter++;
    update();
  }

  decrement() {
    counter--;
    update();
  }
}
