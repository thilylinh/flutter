import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

getValueFromLocalStorageByKey(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.get(key).toString());
  } catch (e) {
    return null;
  }
}

setValueToLocalStorage(String key, dynamic value) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  } catch (e) {
    return null;
  }
}

checkExistingKeyInLocalStorage(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  } catch (e) {
    return null;
  }
}
