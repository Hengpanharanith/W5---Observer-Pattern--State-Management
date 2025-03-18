import 'package:flutter/material.dart';
import '../../dto/post_dto.dart';
import '../../model/post.dart';
import '../../repository/post_repository.dart';
import 'async_value.dart';
import '../../repository/post_repository_online.dart';
class PostProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<Post>? postValue;

  PostProvider({required PostRepository repository}) : _repository = repository;

  void fetchPost(int postId) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      Post post = await _repository.getPost(postId);

      // 3  Set success state
      postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
class PostProviderOnline extends ChangeNotifier {
  final PostRepositoryO _repository;

  AsyncValue<List<Post1>>? postValue;

  PostProviderOnline({required PostRepositoryO repository}) : _repository = repository;


  void fetchPost(List<int> postId) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
     List<Post1> post = await _repository.getPosts(postId);

      // 3  Set success state
      postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}