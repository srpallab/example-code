import 'package:flutter/material.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List elements = [
      "Box Girder",
      "Bearing Assembly",
      "Girder",
      "Hanger of Arch",
      "River Training",
    ];

    return DropdownButton<String>(
      elevation: 16,
      underline: Container(
        width: double.infinity,
        height: 2,
        color: Colors.green,
      ),
      items: elements.map<DropdownMenuItem<String>>((element) {
        return DropdownMenuItem<String>(
          value: element,
          child: Text(element),
        );
      }).toList(),
      onChanged: (value) {},
    );
  }
}
