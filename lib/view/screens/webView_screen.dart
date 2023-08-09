// ignore_for_file: camel_case_types
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';

import 'package:webview_flutter/webview_flutter.dart';



class web_screen extends StatefulWidget {
  final String url;
  final String title;
  const web_screen({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  State<web_screen> createState() => _web_screenState();
}

class _web_screenState extends State<web_screen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,()async{
      if(Platform.isAndroid) WebView.platform=AndroidWebView();
    });
  }
  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit,CategoryState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: cubit.colorscreen,
              appBar: AppBar(
                leading:  IconButton(
                  onPressed: (){
                    Navigator.pop(context);},
                  icon: const Icon(Icons.arrow_back,color: Colors.white,size: 30,),),
                toolbarHeight:MediaQuery.of(context).size.height/8,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60)
                    )
                ),
                backgroundColor:cubit.colorappbar,
                title:  Text(widget.title,
                  style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: (){
                    provider.changemode();
                  }, icon:Icon(provider.colormode?Icons.lightbulb_outline:Icons.lightbulb,size: 30,)),
                ],

              ),
              body: WebView(
                initialUrl:widget.url ,
              ),
            ),
          );
        }
    );
  }
}
