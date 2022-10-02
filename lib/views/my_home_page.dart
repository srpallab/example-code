import 'package:flutter/material.dart';

import 'span_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AGED"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                bridgeTextForm("Width (m)"),
                bridgeTextForm("Carriageway Width (m)"),
                bridgeTextForm("Sidewalk (L/S) (m)"),
                bridgeTextForm("Sidewalk (R/S) (m)"),
                // TODO: New Span Adding Functionality.
                ElevatedButton(onPressed: () {}, child: const Text("Add Span")),
                const Span(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding bridgeTextForm(String labelText) {
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
}
