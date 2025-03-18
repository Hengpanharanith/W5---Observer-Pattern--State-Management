import '../dto/post_dto.dart';
abstract class PostRepositoryO {
  Future<List<Post1>> getPosts(List<int> postIds);
}