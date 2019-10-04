import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brother_printer/brother_printer.dart';

void main() {
  const MethodChannel channel = MethodChannel('brother_printer');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BrotherPrinter.platformVersion, '42');
  });
}
