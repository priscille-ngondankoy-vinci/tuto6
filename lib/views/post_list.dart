import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../view_model/theme_view_model.dart';
import '../widgets/nav_bar.dart';



class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ThemeViewModel>(context);
    return Scaffold(
        appBar: navBar(context, 'Posts'),
    body: const Center(
    child: Text('Post List'),
    )
    );
  }

}



