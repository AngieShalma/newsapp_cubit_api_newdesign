// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:iti_project_newsapp/view/screens/webView_screen.dart';

import 'package:provider/provider.dart';


import 'listview.dart';
class search extends StatelessWidget {
  search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit,CategoryState>(

        builder:(context,state){
          return SafeArea(
            child: Scaffold(
              backgroundColor: cubit.colorscreen,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight:MediaQuery.of(context).size.height/8,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60)
                    )
                ),
                backgroundColor:cubit.colorappbar,
                title:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    cursorHeight: 5,
                    autofocus:true,
                    cursorWidth: 1,
                    cursorColor: Colors.deepOrange,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      isDense: true,
                      hintStyle: const TextStyle(fontSize: 20),
                      hintText: "search",
                      prefixIcon: IconButton(
                        onPressed: (){
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          cubit.Searchlist=[];
                          Navigator.pop(context);},
                        icon: const Icon(Icons.close,color: Colors.deepOrange,size: 30,),),
                      suffixIcon:const Icon(Icons.search,size: 30,color: Colors.deepOrange,) ,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.deepOrange,)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.deepOrange,)
                      ),
                    ),
                    onChanged: (value){
                      cubit.searchdata(q:value);
                    },
                  ),
                ),
                centerTitle: true,

              ),
              body: SizedBox(
                  height: MediaQuery.of(context).size.height*.9,
                  child:  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:ListView.separated(
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
                                        image:"${cubit.Searchlist[index]["urlToImage"]}",
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
                                        Text("${cubit.Searchlist[index]["title"]}"
                                          ,overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: cubit.colortext),maxLines: 3,),
                                        Text("${cubit.Searchlist[index]["publishedAt"]}"
                                          ,
                                          style: TextStyle(fontSize: 15,color: cubit.colorDate),)

                                      ],),
                                  )
                                ],
                              ),
                              onTap: (){
                                cubit.Url=cubit.Searchlist[index]["url"];
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>web_screen()
                                ));
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index){
                          return Divider(color:cubit.colortext
                          );
                        }, itemCount: cubit.Searchlist.length
                    ),
                  )),
            ),
          );
        }
    );
  }
}
