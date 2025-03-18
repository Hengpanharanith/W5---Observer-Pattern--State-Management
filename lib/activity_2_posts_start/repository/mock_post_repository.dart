import '../model/post.dart';
import './post_repository.dart';

class MockPostRepository implements PostRepository {
  @override
  Future<Post> getPost(int postId) async {
    await Future.delayed(const Duration(seconds: 3));
    if (postId == 25) {
      return Post(
        id: 25,
        title: 'Heng Panharanith',
        description: 'The best',
      );
    } else {
      throw Exception("No data");
    }
  }
}
