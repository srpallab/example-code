import 'package:flutter/material.dart';

import '../../../models/span_model.dart';

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
  final state = _SpanFormWidgetState();

  @override
  State<SpanFormWidget> createState() => state;

  final TextEditingController _spanSerialController = TextEditingController();
  final TextEditingController _spanLengthController = TextEditingController();
  bool isValidated() => state.validate();
}

class _SpanFormWidgetState extends State<SpanFormWidget> {
  final formKey = GlobalKey<FormState>();

  bool validate() {
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ExpansionTile(
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
                    validator: (value) =>
                        value!.length > 3 ? null : "Enter Serial",
                    onSaved: (value) => widget.spanModel.spanName = value!,
                    onChanged: (value) => widget.spanModel.spanName = value,
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
                    validator: (value) =>
                        value!.length > 3 ? null : "Enter Length",
                    onSaved: (value) => widget.spanModel.spanLength = value!,
                    onChanged: (value) => widget.spanModel.spanLength = value,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => widget.onRemove(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
