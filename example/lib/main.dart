import 'package:flutter/material.dart';
import 'package:launch_args/launch_args.dart';

Future<void> main(List<String>? args) async {
  WidgetsFlutterBinding.ensureInitialized();
  args = args?.isNotEmpty == true ? args : (await LaunchArgs.args);

  runApp(MyApp(args: args));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.args});

  final List<String>? args;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Launch Args'),
        ),
        body: ListView(
          children: [
            for (var arg in args ?? <String>['n/a'])
              ListTile(
                title: Text(arg),
              ),
          ],
        ),
      ),
    );
  }
}
