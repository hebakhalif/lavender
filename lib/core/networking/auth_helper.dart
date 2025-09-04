 import 'package:hive/hive.dart';

class AuthHelper {
  static final _box = Hive.box("auth");


  static Future<void> saveTokens (String access, String refresh) async{
    await _box.put('access', access);
    await _box.put("refresh", refresh);
  }

  static String? get access=> _box.get("access");
  static String? get refresh=> _box.get("refresh");

  static Future<void> clear() async=> await _box.clear();
 }
