import 'package:flutter/material.dart';

class Component extends StatefulWidget {
  const Component({Key? key}) : super(key: key);

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  final List elements = [
    "Box Girder",
    "Bearing Assembly",
    "Girder",
    "Hanger of Arch",
    "River Training",
  ];
  late String? dropdownValue;

  @override
  void initState() {
    dropdownValue = elements.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
            value: dropdownValue,
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
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
            }),
      ],
    );
  }
}
