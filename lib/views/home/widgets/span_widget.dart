import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import 'component_widget.dart';

class Span extends StatefulWidget {
  const Span({Key? key}) : super(key: key);

  @override
  State<Span> createState() => _SpanState();
}

class _SpanState extends State<Span> {
  final bridgeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        spanSection(),
        ElevatedButton(onPressed: () {}, child: const Text("Add Span")),
      ],
    );
  }

  Widget spanSection() {
    return const ExpansionTile(
      title: Text("Span"),
      children: [Component()],
    );
  }
}
