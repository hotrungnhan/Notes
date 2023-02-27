import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:io' show Platform;
import 'dart:async';

Future main() async {
  await dotenv.load(mergeWith: !kIsWeb ? Platform.environment : {});
  await Hive.init/Flutter();

  runApp(const MyApp());
}
