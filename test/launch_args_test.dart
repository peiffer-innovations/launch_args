import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:launch_args/launch_args.dart';
import 'package:websafe_platform/websafe_platform.dart';

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

  test('args android', () async {
    WebsafePlatform.override(MockWebsafePlatform(android: true));
    expect(await LaunchArgs.args, ['arg1', 'arg2', 'arg3']);
  });

  test('args ios', () async {
    WebsafePlatform.override(MockWebsafePlatform(ios: true));
    expect(await LaunchArgs.args, ['arg1', 'arg2', 'arg3']);
  });

  test('args macos', () async {
    WebsafePlatform.override(MockWebsafePlatform(macos: true));
    expect(await LaunchArgs.args, []);
  });
}

class MockWebsafePlatform implements WebsafePlatform {
  MockWebsafePlatform({
    this.android = false,
    this.fuchsia = false,
    this.ios = false,
    this.linux = false,
    this.macos = false,
    this.web = false,
    this.windows = false,
  });

  final bool android;
  final bool fuchsia;
  final bool ios;
  final bool linux;
  final bool macos;
  final bool web;
  final bool windows;

  @override
  bool isAndroid() => android;

  @override
  bool isFuchsia() => fuchsia;

  @override
  bool isIOS() => ios;

  @override
  bool isLinux() => linux;

  @override
  bool isMacOS() => macos;

  @override
  bool isWeb() => web;

  @override
  bool isWindows() => windows;
}
