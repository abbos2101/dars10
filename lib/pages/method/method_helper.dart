import 'package:flutter/services.dart';

const _channel1 = MethodChannel('uz.gita/channel1');

class MethodHelper {
  Future<int> getRandom() async {
    return await _channel1.invokeMethod("getRandomNumber") ?? 0;
  }
}
