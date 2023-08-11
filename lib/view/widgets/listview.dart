import 'dart:async';

import 'package:flutter/cupertino.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
  return BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return cubit.loading? Center(child: CircularProgressIndicator(color: Colors.purple,),):
    ListView.separated(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top:15),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // width: 380,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.only( topRight:  Radius.circular(40),//topLeft:  Radius.circular(40)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(

                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.3,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.black26,
                                ),
                              ],
                              borderRadius: BorderRadius.only( topRight:  Radius.circular(40)),
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
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: cubit.colortext),maxLines: 3,),
                              Text("${cubit.listviewdata[index]["publishedAt"]}"
                                ,
                                style: TextStyle(fontSize: 15,color: cubit.colorDate),)

                            ],),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: -20,
                    top: 40,
                    child: InkWell(
                      onTap: (){
                        cubit.Url=cubit.listviewdata[index]["url"];
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>web_screen()
                        ));
                      },
                      child: PhysicalModel(
                        color: Colors.black,
                        elevation: 15.0,
                        shape: BoxShape.circle,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:Colors.white ,
                          child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index){
            return SizedBox(height: 10,);
            //   Divider(color:cubit.colortext
            // );
          },
        itemCount: cubit.listviewdata.length
      );

  },
);
  }
}
