import 'package:api_call/controller/post_controller.dart';
import 'package:api_call/model/post_model.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<PostModel> posts = [];
  final postCtrl = PostController();

  void _getPosts() async {
    final data = await postCtrl.getPostList();
    setState(() {
      posts = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: (posts.length < 1)
          ? Text('Loading...')
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${posts[index].id}'),
                );
              }),
    );
  }
}
