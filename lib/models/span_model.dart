import 'component_model.dart';

class SpanModel {
  int id;
  String spanName;
  String spanLength;
  List<Components> components;

  SpanModel({
    required this.id,
    required this.spanName,
    required this.spanLength,
    required this.components,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['span_name'] = spanName;
    data['span_length'] = spanLength;
    data['Components'] = components.map((v) => v.toJson()).toList();
    return data;
  }
}
