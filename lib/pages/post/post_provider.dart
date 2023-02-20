import 'package:dars10/core/post_api.dart';
import 'package:dars10/core/post_model.dart';
import 'package:flutter/material.dart';

enum PostStates { initial, fail, loading, success }

class PostProvider extends ChangeNotifier {
  final PostApi _api;

  PostProvider(this._api) {
    fetchPosts();
  }

  //var _count = 0;
  var _state = PostStates.initial;
  var _posts = <PostModel>[];

  Future<void> fetchPosts() async {
    _state = PostStates.loading;
    notifyListeners();
    try {
      _posts = await _api.posts();
      _state = PostStates.success;
      notifyListeners();
    } catch (e) {
      _state = PostStates.fail;
      notifyListeners();
    }
  }

  // void increment() {
  //   _count++;
  //   notifyListeners();
  // }

  // int get count => _count;

  PostStates get state => _state;

  List<PostModel> get posts => _posts;
}
