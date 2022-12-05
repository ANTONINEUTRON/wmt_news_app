import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/articles/view/bloc/article_bloc.dart';
import 'features/home/view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return ArticleBloc();
      },
      child: MaterialApp(
          title: 'WMT News App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false
      ),
    );
  }
}