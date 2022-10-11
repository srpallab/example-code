import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';

class Component extends StatefulWidget {
  const Component({Key? key}) : super(key: key);

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  final bridgeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("Add Component"),
        ),
      ],
    );
  }

  Widget componentTextForm(String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }

  Widget componentSection() {
    return ExpansionTile(
      title: const Text("Component"),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Element:"),
          ],
        ),
        componentTextForm("Element Serial"),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Remove Component"),
        )
      ],
    );
  }
}
