import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx6_7/getx_controller.dart';
import 'package:getx6_7/second_screen.dart';
import 'package:getx6_7/todolistApp/screens/home_dotoapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      home: HomeTodoApp(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => SecondScreen());
              },
              icon: const Icon(Icons.arrow_forward)),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: Center(
          child: GetBuilder<CounterController>(
        builder: (_) => Text(
          counterController.counter.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await counterController.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () async {
              await counterController.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
