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
      print("key: $key");
      if (key == 'data') {
        if (data[value] != null) {
          uiMap[key] = data[value];
        }
      }
      if (key == "child") {
        uiMap[key] = bindingJsonUIAndData(uiMap[key], data);
      }
      if (key == "children") {
        uiMap[key].forEach((child) {
          child = bindingJsonUIAndData(child, data);
        });
      }
    });
    return uiMap;
  }
}
