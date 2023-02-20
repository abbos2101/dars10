import 'dart:math';

import 'package:dars10/pages/stream/stream_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamControllerPage extends StatelessWidget {
  const StreamControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StreamControllerPage")),
      body: StreamBuilder<int>(
          stream: context.watch<StreamControllerProvider>().stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "${snapshot.data}",
                style: const TextStyle(fontSize: 32),
              );
            }
            return const SizedBox();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<StreamControllerProvider>()
              .sink
              .add(Random().nextInt(1000));
        },
      ),
    );
  }
}
