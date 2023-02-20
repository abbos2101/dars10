import 'package:dars10/core/post_api.dart';
import 'package:dars10/di.dart';
import 'package:dars10/pages/method/method_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodPage extends StatefulWidget {
  const MethodPage({Key? key}) : super(key: key);

  @override
  State<MethodPage> createState() => _MethodPageState();
}

class _MethodPageState extends State<MethodPage> {
  final helper = MethodHelper();
  var progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(await helper.getRandom());
          final api = di.get<PostApi>();
          api.download(
            "url",
            "tmp",
            onReceiveProgress: (count, total) {
              progress = count * 100 / total;
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
