import 'package:example_code/models/span_model.dart';

class BridgeModel {
  final int width;
  final int carriagewayWidth;
  final int sidewalkLS;
  final int sidewalkRS;
  final List<SpanModel> span;

  BridgeModel(
    this.width,
    this.carriagewayWidth,
    this.sidewalkLS,
    this.sidewalkRS,
    this.span,
  );
}
