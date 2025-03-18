//Offline 
import 'package:flutter/material.dart';
import 'repository/mock_post_repository.dart';
import 'repository/post_repository.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  PostRepository postRepo = MockPostRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: postRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}




//Online 

// import 'package:flutter/material.dart';
// import './https/http_posts_repository.dart';
// import 'repository/post_repository_online.dart';
// import 'package:provider/provider.dart';
// import 'ui/providers/post_provider.dart';
// import 'ui/screens/post_screen_online.dart';

// void main() {

//   PostRepositoryO postRepo = HttpPostsRepository() ;


//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PostProviderOnline(repository: postRepo),
//       child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
//     ),
//   );
// }