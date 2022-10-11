import 'dart:developer';

import 'package:example_code/models/span_model.dart';
import 'package:example_code/views/home/widgets/span_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List spanData = [].obs;
  List componentData = [].obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController spanSerialController = TextEditingController();
  final TextEditingController spanLengthController = TextEditingController();

  bool validate() {
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }

  addSpanDialog() {
    return Get.defaultDialog(
      title: "Add Span",
      textConfirm: "ADD",
      onConfirm: () {
        if (validate()) {
          log(spanData.length.toString());
          spanData.add(
            SpanModel(
              id: spanData.length,
              spanName: spanSerialController.text,
              spanLength: spanLengthController.text,
              components: [],
            ),
          );
          Get.back();
        }
      },
      buttonColor: Colors.green,
      confirmTextColor: Colors.white,
      textCancel: "CANCEL",
      cancelTextColor: Colors.red,
      content: const SpanFormWidget(),
    );
  }

  void removeSpan(SpanModel spanModel) {
    int spanIndex = spanData.indexWhere((span) => span.id == spanModel.id);
    spanData.removeAt(spanIndex);
  }
}
