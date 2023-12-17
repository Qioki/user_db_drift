import 'package:flutter/material.dart';
import 'package:user_db_drift/di/locator.dart';
import 'package:user_db_drift/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}
