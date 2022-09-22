import 'dart:convert';

import 'package:api_call/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostController {
  Future<List<PostModel>> getPostList() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');

    final response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<PostModel> arr = [];

    List<dynamic> data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) arr.add(PostModel.fromJson(data[i]));

    return arr;
  }
}
