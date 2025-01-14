import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd_task_app/features/posts/cubit/post_state.dart';
import 'package:hrd_task_app/utils/constants/texts.dart';
import '../service/post_service.dart';
import 'package:hrd_task_app/utils/utility.dart';

class PostCubit extends Cubit<PostState> {
  final PostService postService;
  PostCubit(this.postService) : super(PostLoadingState());

  Future<void> loadPosts() async {
    emit(PostLoadingState());
    try {
      final hasInternet = await Utility.checkInternet(); // Check internet
      if (hasInternet) {
        final posts = await postService.fetchAndCachePosts();
        emit(PostLoadedState(posts));
      } else {
        final cachedPosts = await postService.getCachedPosts();
        emit(PostLoadedState(cachedPosts));
      }
    } catch (e) {
      try {
        final cachedPosts = await postService.getCachedPosts();
        emit(PostLoadedState(cachedPosts));
      } catch (_) {
        emit(PostErrorState(AppTexts.failedToLoadposts));
      }
    }
  }
}


//-----
// class PostCubit extends Cubit<PostState> {
//   final PostService postService;
//   PostCubit(this.postService) : super(PostLoadingState());
//   Future<void> loadPosts() async {
//     emit(PostLoadingState());
//     try {
//       final posts = await postService.fetchAndCachePosts();
//       emit(PostLoadedState(posts));
//     } catch (e) {
//       try {
//         final cachedPosts = await postService.getCachedPosts();
//         emit(PostLoadedState(cachedPosts));
//       } catch (_) {
//         emit(PostErrorState(AppTexts.failedToLoadposts));
//       }
//     }
//   }
// }