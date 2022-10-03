import 'package:example_code/models/span_model.dart';
import 'package:flutter/material.dart';

class SpanFormWidget extends StatefulWidget {
  SpanFormWidget({
    Key? key,
    required this.spanModel,
    required this.index,
    required this.onRemove,
  }) : super(key: key);
  final int index;
  final SpanModel spanModel;
  final Function onRemove;

  @override
  State<SpanFormWidget> createState() => _SpanFormWidgetState();

  final TextEditingController _spanSerialController = TextEditingController();
  final TextEditingController _spanLengthController = TextEditingController();
}

class _SpanFormWidgetState extends State<SpanFormWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ExpansionTile(
        title: Text("Span - ${widget.index}"),
        children: [
          TextFormField(
            controller: widget._spanSerialController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(),
              hintText: "Span Serial",
              labelText: "Span Serial",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget._spanLengthController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(),
              hintText: "Span Length",
              labelText: "Span Length",
            ),
          ),
        ],
      ),
    );
  }
}
