import 'package:get/get.dart';

import '../../models/span_model.dart';
import '../../views/home/widgets/span_form_widget.dart';

class HomeController extends GetxController {
  List spanWidgetList = [].obs;
  Map<String, dynamic> spanData = {};
  List componentList = [].obs;
  List dropDownButtonList = [].obs;
  Map<int, String> dropdownValueList = {};

  @override
  void onInit() {
    SpanModel spanModel = SpanModel(
      id: 0,
      spanLength: "",
      spanName: "",
      components: [],
    );
    spanWidgetList.add(
      SpanFormWidget(
        spanModel: spanModel,
        index: 1,
        onRemove: () => onRemove(spanModel),
      ),
    );
    super.onInit();
  }

  void addSpan() {
    SpanModel spanModel = SpanModel(
      id: spanWidgetList.length,
      spanLength: "",
      spanName: "",
      components: [],
    );

    spanWidgetList.add(
      SpanFormWidget(
        spanModel: spanModel,
        index: spanWidgetList.length + 1,
        onRemove: () => onRemove(spanModel),
      ),
    );
  }

  void onRemove(SpanModel spanModel) {
    int index = spanWidgetList
        .indexWhere((element) => element.spanModel.id == spanModel.id);

    if (spanWidgetList.isNotEmpty) {
      spanWidgetList.removeAt(index);
    }
  }
}
