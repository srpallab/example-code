import 'dart:developer';

import 'package:example_code/models/component_model.dart';
import 'package:example_code/models/span_model.dart';
import 'package:example_code/views/home/widgets/component_form_widget.dart';
import 'package:example_code/views/home/widgets/span_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<SpanModel> spanData = <SpanModel>[].obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController spanSerialController = TextEditingController();
  final TextEditingController spanLengthController = TextEditingController();
  final TextEditingController componentSerialController =
      TextEditingController();

  final List elements = [
    "Box Girder",
    "Bearing Assembly",
    "Girder",
    "Hanger of Arch",
    "River Training",
  ];
  RxString dropDownValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    dropDownValue.value = elements.first;
  }

  bool validate() {
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }

  updateComponent(int index) {
    spanData[index].components.add(
          ComponentModel(
            id: spanData[index].components.length,
            componentId: dropDownValue.value,
            elementSerial: componentSerialController.text,
          ),
        );
    spanData.refresh();
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

  addComponentDialog(int index) {
    return Get.defaultDialog(
      title: "Add Component",
      textConfirm: "ADD",
      onConfirm: () {
        if (validate()) {
          updateComponent(index);
          Get.back();
        }
      },
      buttonColor: Colors.green,
      confirmTextColor: Colors.white,
      textCancel: "CANCEL",
      cancelTextColor: Colors.red,
      content: const ComponentFormWidget(),
    );
  }

  void removeSpan(SpanModel spanModel) {
    int spanIndex = spanData.indexWhere((span) => span.id == spanModel.id);
    spanData.removeAt(spanIndex);
  }

  void removeComponent(int index, ComponentModel componentModel) {
    log(index.toString());
    log(componentModel.id.toString());
    int componentIndex = spanData[index]
        .components
        .indexWhere((component) => componentModel.id == component.id);
    spanData[index].components.removeAt(componentIndex);
    spanData.refresh();
  }
}
