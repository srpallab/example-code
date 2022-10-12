import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';

class MyDropDownButton extends StatelessWidget {
  MyDropDownButton({Key? key}) : super(key: key);
  final bridgeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (logic) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: DropdownButton<String>(
            value: bridgeController.dropDownValue.value,
            isExpanded: true,
            elevation: 16,
            underline: Container(
              width: double.infinity,
              height: 2,
              color: Colors.green,
            ),
            items: bridgeController.elements
                .map<DropdownMenuItem<String>>((element) {
              return DropdownMenuItem<String>(
                value: element,
                child: Text(element),
              );
            }).toList(),
            onChanged: (value) {
              bridgeController.dropDownValue.value = value!;
            },
          ),
        );
      },
    );
  }
}
