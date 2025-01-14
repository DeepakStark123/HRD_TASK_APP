import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd_task_app/features/posts/cubit/post_state.dart';
import 'package:hrd_task_app/utils/constants/sizes.dart';
import 'package:hrd_task_app/utils/constants/texts.dart';
import '../cubit/post_cubit.dart';
import '../model/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    BlocProvider.of<PostCubit>(context).loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.posts),
        centerTitle: true,
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadedState) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              padding: const EdgeInsets.all(AppSizes.sm),
              itemBuilder: (context, index) {
                final PostModel post = posts[index];
                return Card(
                  elevation: 5,
                  margin: const  EdgeInsets.all(AppSizes.sm),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(
                            fontSize: AppSizes.fontSizeLg,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height:AppSizes.spaceBtwItemsSm),
                        Text(
                          post.body,
                          style: const TextStyle(
                            fontSize: AppSizes.fontSizeMd,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PostErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: AppSizes.iconXLg),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Text(
                    (state).message,
                    style: const TextStyle(fontSize: AppSizes.fontSizeLg, color: Colors.black54),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
