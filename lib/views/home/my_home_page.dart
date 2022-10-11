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
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Span"),
        onPressed: bridgeController.addSpanDialog,
      ),
      body: GetX<HomeController>(
        builder: (_) {
          return ListView.builder(
            itemCount: bridgeController.spanData.length,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Span Serial: "),
                        Text(bridgeController.spanData[index].spanName),
                        const Text("Span Length: "),
                        Text(bridgeController.spanData[index].spanLength),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            bridgeController.removeSpan(
                              bridgeController.spanData[index],
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add Component"),
                          ),
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
