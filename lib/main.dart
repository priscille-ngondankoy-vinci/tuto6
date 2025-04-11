
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:tuto6/services/post_service.dart';
import 'package:tuto6/view_model/post_view_model.dart';
import 'package:tuto6/view_model/theme_view_model.dart';
import 'package:tuto6/views/new_List.dart';
import 'package:tuto6/views/post_details.dart';
import 'package:tuto6/views/post_list.dart';
import 'package:tuto6/views/settings.dart';

//main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final databaseProvider = PostService();
  await databaseProvider.initDatabase();
  runApp(MyApp(postService: databaseProvider));
}
class MyApp extends StatelessWidget {
  final PostService postService;

  MyApp({super.key, required this.postService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostViewModel>(
          create: (context) => PostViewModel(postService),
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routerConfig: _router,
      ),
    );
  }
  final _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const PostList(),
            routes: [
              GoRoute(
                path: 'new_post',
                builder: (context, state) => const NewPost(),
              ),
              GoRoute(
                path: 'settings',
                builder: (context, state) => const Settings(),
              ),
              GoRoute(
                path: 'posts/:id',
                builder:
                    (context, state) => PostDetails(
                  postId: state.pathParameters['id'] ?? '',
                ),
              ),
            ]
        )
      ]
  );
}




