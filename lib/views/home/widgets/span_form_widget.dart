import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';

class SpanFormWidget extends StatefulWidget {
  const SpanFormWidget({Key? key}) : super(key: key);

  @override
  State<SpanFormWidget> createState() => _SpanFormWidgetState();
}

class _SpanFormWidgetState extends State<SpanFormWidget> {
  final bridgeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return spanFormMainSection();
  }

  Padding spanFormMainSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Form(
        key: bridgeController.formKey,
        child: Column(
          children: [
            spanSerialTextFormField(),
            const SizedBox(height: 8),
            spanLengthTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget spanLengthTextFormField() {
    return TextFormField(
      controller: bridgeController.spanLengthController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(),
        hintText: "Span Length",
        labelText: "Span Length",
      ),
      validator: (value) => value!.length > 1 ? null : "Enter Length",
      onSaved: (value) => bridgeController.spanLengthController.text = value!,
    );
  }

  Widget spanSerialTextFormField() {
    return TextFormField(
      controller: bridgeController.spanSerialController,
      keyboardType: TextInputType.text,
      textDirection: TextDirection.ltr,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(),
        hintText: "Span Serial",
        labelText: "Span Serial",
      ),
      validator: (value) => value!.length > 1 ? null : "Enter Serial",
      onSaved: (value) => bridgeController.spanSerialController.text = value!,
    );
  }
}
