import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bridgeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LGED")),
      body: GetX<HomeController>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: bridgeController.spanWidgetList.length,
                  itemBuilder: (_, index) {
                    return bridgeController.spanWidgetList[index];
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: bridgeController.addSpan,
                    child: const Text("Add Span"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool allValid = true;
                      for (var element in bridgeController.spanWidgetList) {
                        allValid = (allValid && element.isValidated());
                      }
                      if (allValid) {}
                    },
                    child: const Text("SAVE"),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
