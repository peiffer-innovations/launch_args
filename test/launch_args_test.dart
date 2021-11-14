import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('launchargs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ['arg1', 'arg2', 'arg3'];
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('no-op', () {});
}
