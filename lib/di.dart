import 'package:dars10/core/post_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> setup() async {
  // await Firebase.initializeApp();
  di.registerFactory(() => PostApi());
}
