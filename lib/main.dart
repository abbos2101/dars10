import 'package:dars10/di.dart';
import 'package:dars10/pages/post/post_page.dart';
import 'package:dars10/pages/post/post_provider.dart';
import 'package:dars10/pages/stream/stream_controller_page.dart';
import 'package:dars10/pages/stream/stream_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/method/method_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        "/": (context) {
          return ChangeNotifierProvider(
            create: (context) => PostProvider(di.get()),
            child: const PostPage(),
          );
        },
        "/stream": (context) {
          return ChangeNotifierProvider(
            create: (context) => StreamControllerProvider(),
            child: const StreamControllerPage(),
          );
        },
        "/channel": (context) => const MethodPage()
      },
      initialRoute: "/channel",
    );
  }
}
