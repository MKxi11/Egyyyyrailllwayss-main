import 'package:flutter/material.dart';
import 'di.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initdi();
  }
}
