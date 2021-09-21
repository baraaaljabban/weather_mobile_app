import 'package:flutter/material.dart';
import 'core/Service/injection_service.dart' as di;
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
