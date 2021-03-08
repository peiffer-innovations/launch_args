import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

/// Plugin to retrieve the list of command line arguments that were passed to
/// the application.
class LaunchArgs {
  static const MethodChannel _channel = MethodChannel('launchargs');
  static final Logger _logger = Logger('LaunchArgs');

  /// Returns the list of command line arguments that were passed to the
  /// application at start.  This only supports Android and iOS currently.  All
  /// other platforms will result in an empty list being returned.
  static Future<List<String>> get args async {
    var args = <String>[];

    if (!kIsWeb) {
      if (Platform.isAndroid || Platform.isIOS) {
        try {
          args = List<String>.from(await _channel.invokeMethod('args'));
        } catch (e, stack) {
          _logger.severe('Error getting launch args.', e, stack);
        }
      }
    }

    return args;
  }
}
