import 'package:flutter/material.dart';

import 'component_widget.dart';

class Span extends StatefulWidget {
  const Span({Key? key}) : super(key: key);

  @override
  State<Span> createState() => _SpanState();
}

class _SpanState extends State<Span> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Component()],
    );
  }
}
