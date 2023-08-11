import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/view/screens/search_screen.dart';

import '../../cubit/category_cubit.dart';
import '../widgets/drawer.dart';
import '../widgets/listview.dart';
import '../widgets/source.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {

   Future.delayed(Duration(),()async{
    await  context.read<CategoryCubit>().getsorce(cat:context.read<CategoryCubit>().cat);
     await context.read<CategoryCubit>().getlist(cat:context.read<CategoryCubit>().cat,
         scr:context.read<CategoryCubit>().source[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();

    return BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return Scaffold(
      key: _scaffoldKey,
     backgroundColor: cubit.colorscreen,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: cubit.colorappbar,
        leading: InkWell(
            onTap:  () => _scaffoldKey.currentState?.openDrawer(),
            child: Icon(Icons.menu,size: 30,color: Colors.black,)),
        title: Text("Categories",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));
                },
                child: Icon(Icons.search,size: 30,color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (){
                  cubit.changemode();
                },
                // }, icon:Icon(provider.colormode?Icons.lightbulb_outline:Icons.lightbulb,size: 30,)),

                child: Icon(cubit.colormode?Icons.wb_sunny:Icons.wb_sunny_outlined,size: 30,color: Colors.black)),
          ),
        ],
      ),
      drawer: drawer(),
      body: SafeArea(
        child: Column(
          children: [
            sourceScreen(),
           

            Expanded(child: listview()),

          ],
        ),
      ),
    );
  },
);
  }
}
