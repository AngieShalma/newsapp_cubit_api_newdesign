import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/category_cubit.dart';
import 'listview.dart';
import 'sorce.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  void initState() {
    // Timer(Duration( ),(){
    //    context.read<CategoryCubit>().getsorce(cat:context.read<CategoryCubit>().cat);
    //   // context.read<CategoryCubit>().getlist(cat:context.read<CategoryCubit>().cat,
    //   //     scr:context.read<CategoryCubit>().sorce[0]["Url"]);
    // });
    Future.delayed(Duration(seconds: 3),(){
      context.read<CategoryCubit>().getsorce(cat:context.read<CategoryCubit>().cat);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            sorce(),
            Expanded(child: listview()),

          ],
        ),
      ),
    );
  }
}
