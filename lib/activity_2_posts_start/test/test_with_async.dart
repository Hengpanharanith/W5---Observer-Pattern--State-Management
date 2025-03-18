// ignore_for_file: avoid_print
import '../repository/mock_post_repository.dart';

void main() async {
  // 1- Create the repo
  final postRepository = MockPostRepository();

  // TODO

  // 2- Request the post  - Success
  try {
    final post = await postRepository.getPost(25);
    print(post);
  } catch (e) {
    print("error $e");
  } // TODO

  // 3- Request the post - Failed
  try {
    final failed = await postRepository.getPost(5);
    print(failed);
  } catch (e) {
    print("Failed $e");
  }

  // TODO
}
