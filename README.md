<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [launch_args](#launch_args)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Usage](#usage)
  - [Passing Args](#passing-args)
    - [Android](#android)
    - [iOS](#ios)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# launch_args

## Table of Contents

* [Introduction](#introduction)
* [Usage](#usage)
* [Passing Args](#passing-args)
    * [Android](#android)
    * [iOS](#ios)

## Introduction

Flutter package to be able to get the args passed to an Android or iOS application.  This plugin currently only supports Android and iOS as most other platforms provide the args to the `main` function directly.

---

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:launch_args/launch_args.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  args = args?.isNotEmpty == true ? args : (await LaunchArgs.args);

  runApp(MyApp(args: args));
}
```

---

## Passing Args

### Android

**adb**
```
adb -s $DEVICE_ID shell am start \
  -n $ANDROID_PACKAGE/$ANDROID_ACTIVITY \
  -ez [arg name] [value] \
  -ez [arg name2] [value 2] \
  ...
```

*Note*: The arg names on android will be prefexed with `--` to make it compatible with the options from the [args](https://pub.dev/packages/args) package as Android always uses key / value pairs.


### iOS

**ios-deploy**
```
$FLUTTER_HOME/bin/cache/artifacts/ios-deploy/ios-deploy --id $DEVICE_ID \
  --bundle build/ios/iphoneos/Runner.app \
  --debug \
  --args [arg name] [arg value] [arg name2] [arg value2] ...

```