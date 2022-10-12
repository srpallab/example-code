class ComponentModel {
  int id;
  String componentId;
  String elementSerial;

  ComponentModel(
      {required this.id,
      required this.componentId,
      required this.elementSerial});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Component_Id'] = componentId;
    data['Element_Serial'] = elementSerial;
    return data;
  }
}
