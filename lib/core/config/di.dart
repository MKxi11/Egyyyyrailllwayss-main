import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;
Future<void> initdi() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  di.registerLazySingleton(() => prefs);
 
}
