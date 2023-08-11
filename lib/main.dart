import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:iti_project_newsapp/cubit/news_api_cubit.dart';
import 'package:iti_project_newsapp/view/screens/categories_screen.dart';
import 'package:iti_project_newsapp/view/screens/splash_screen.dart';
import 'package:iti_project_newsapp/view/widgets/listview.dart';


void main() {
  runApp(

     const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => CategoryCubit())
        ),
        // BlocProvider(create: ((context) => NewsApiCubit())
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
        // newsScreen(),

      ),
    );
  }
}

