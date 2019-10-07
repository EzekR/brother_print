import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class BrotherPrinter {
  static const MethodChannel _channel =
      const MethodChannel('brother_printer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> printImage(String base64) async {
    final String error = await _channel.invokeMethod('printImage', {'data': base64});
    return error;
  }
}
