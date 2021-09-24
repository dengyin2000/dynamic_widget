import 'dart:convert';

class BindingData {
  /// when building your ui
  /// DEMO:
  /// [data]: {
  ///   "title": "This is You title",
  ///   "headUrl": "http...../xxxx.png",
  /// }
  /// Implement UI like this:
  /// Text("title"}
  /// Image.url("headUrl")
  ///
  /// This function will checkout and binding data to your UI.
  static Map<String, dynamic> bindingJsonUIAndData(
      Map<String, dynamic> uiMap, Map<String, dynamic> data) {
    uiMap.forEach((key, value) {
      switch (key) {
        case 'data':
          if (data[value] != null) {
            uiMap[key] = data[value];
          }
          break;
        case 'child':
          if (uiMap[key] != null)
            uiMap[key] = bindingJsonUIAndData(uiMap[key], data);
          break;
        case 'children':
          uiMap[key].forEach((child) {
            child = bindingJsonUIAndData(child, data);
          });
          break;
        case 'tempChild':
          if (uiMap.containsKey('dataKey') && uiMap.containsKey('children')) {
            var dataList = data[uiMap['dataKey']];
            if (dataList != null && dataList is List) {
              List children = [];
              final childJson = jsonEncode(value);
              dataList.forEach((element) {
                final Map<String, dynamic> child = jsonDecode(childJson);
                children.add(bindingJsonUIAndData(child, element));
              });
              uiMap['children'] = children;
            }
          }
          break;
      }
    });
    return uiMap;
  }
}
