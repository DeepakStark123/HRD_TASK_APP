import 'package:hrd_task_app/features/posts/model/post_model.dart';

class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String message;

  PostErrorState(this.message);
}
