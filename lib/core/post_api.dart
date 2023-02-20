import 'package:dars10/core/post_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PostApi {
  final dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  Future<List<PostModel>> posts() async {
    final response = await dio.get("/posts");
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }

  Future<void> download(
    String url,
    String name, {
    Function(int count, int total)? onReceiveProgress,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    await dio.download(
      url,
      "${dir.path}$name",
      onReceiveProgress: onReceiveProgress,
    );
  }
}
