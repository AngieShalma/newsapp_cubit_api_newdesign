import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:iti_project_newsapp/view/screens/categories_screen.dart';
import 'package:iti_project_newsapp/view/screens/news_screen.dart';


void main() {
  runApp(

     const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: newsScreen(),
        //categoriesScreen(),
      ),
    );
  }
}

