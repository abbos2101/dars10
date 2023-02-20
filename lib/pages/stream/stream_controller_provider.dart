import 'dart:async';

import 'package:flutter/material.dart';

class StreamControllerProvider extends ChangeNotifier {
  final _controller = StreamController<int>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Sink<int> get sink => _controller.sink;

  Stream<int> get stream => _controller.stream;
}
