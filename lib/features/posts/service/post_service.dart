import 'dart:convert';
import 'package:hrd_task_app/utils/constants/texts.dart';

import '../../../database/db_helper.dart';
import '../model/post_model.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constants/api_constants.dart';

class PostService {
  final DbHelper dbHelper;
  PostService(this.dbHelper);

  Future<List<PostModel>> fetchAndCachePosts() async {
    final response = await http.get(Uri.parse(ApiConstants.getPosts));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final posts = jsonData.map((json) => PostModel.fromJson(json)).toList();
      // Cache the posts in the database
      await dbHelper.insertPosts(posts);
      return posts;
    } else {
      throw Exception(AppTexts.failedToLoadposts);
    }
  }

  Future<List<PostModel>> getCachedPosts() async {
    return await dbHelper.getPosts();
  }
}



