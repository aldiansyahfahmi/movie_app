import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../di/injections.dart';
import '../app/main_app.dart';
import '../shared_libraries/utils/setup/app_setup.dart';

void main() async {
  Config.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}
