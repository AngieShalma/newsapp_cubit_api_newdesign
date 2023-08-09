import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/view/screens/webView_screen.dart';
import '../../cubit/category_cubit.dart';

class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {
  void initState() {
    // Timer(Duration(),(){
    //   context.read<CategoryCubit>().getlist(
    //       cat:context.read<CategoryCubit>().cat,
    //       scr:context.read<CategoryCubit>().sorce[0]["Url"]);
    // });
    Future.delayed(Duration.zero,(){
      context.read<CategoryCubit>().getlist(
          cat:context.read<CategoryCubit>().cat,
          scr:context.read<CategoryCubit>().sorce[0]["Url"]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
  return BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return cubit.loading? Center(child: CircularProgressIndicator(),):ListView.separated(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height*0.17,
                        width: MediaQuery.of(context).size.width*0.3,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder:"assets/images/placeholper_image.jpg",
                          fit: BoxFit.cover,
                          image:"${cubit.listviewdata[index]["urlToImage"]}",
                          imageErrorBuilder: (a,b,c){
                            return Image.asset("assets/images/placeholper_image.jpg");
                          },
                        )
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${cubit.listviewdata[index]["title"]}"
                            ,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: cubit.colortext),maxLines: 3,),
                          Text("${cubit.listviewdata[index]["publishedAt"]}"
                            ,
                            style: TextStyle(fontSize: 15,color: cubit.colorDate),)

                        ],),
                    )
                  ],
                ),
                onTap: (){
                  cubit.Url=cubit.listviewdata[index]["url"];
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>web_screen()
                  ));
                },
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider(color:cubit.colortext
            );
          }, itemCount: cubit.listviewdata.length
      );

  },
);
  }
}
