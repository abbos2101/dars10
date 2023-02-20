import 'package:dars10/pages/post/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PostPage")),
      // body: Text(
      //   "${context.watch<PostProvider>().count}",
      //   style: TextStyle(fontSize: 32),
      // ),
      body: Builder(builder: (context) {
        final state = context.watch<PostProvider>().state;
        final posts = context.watch<PostProvider>().posts;
        switch (state) {
          case PostStates.initial:
            return Text(state.name);
          case PostStates.fail:
            return Text("Xatolik");
          case PostStates.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStates.success:
            return ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (_, i) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                return Text(
                  posts[i].title,
                  style: const TextStyle(fontSize: 32),
                );
              },
            );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostProvider>().fetchPosts();
        },
      ),
    );
  }
}
