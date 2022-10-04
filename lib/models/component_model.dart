class Components {
  int componentId;
  int elementSerial;

  Components({required this.componentId, required this.elementSerial});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Component_Id'] = componentId;
    data['Element_Serial'] = elementSerial;
    return data;
  }
}
