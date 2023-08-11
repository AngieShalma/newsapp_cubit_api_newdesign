import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:iti_project_newsapp/view/screens/home_screen.dart';
import 'package:iti_project_newsapp/view/screens/search_screen.dart';
import 'dart:io';

import '../widgets/drawer.dart';
import '../widgets/listview.dart';
class categoriesScreen extends StatefulWidget {
  categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();

}

class _categoriesScreenState extends State<categoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final searchController=TextEditingController();
    final cubit=context.read<CategoryCubit>();
    return Scaffold(
      key: _scaffoldKey,

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
      backgroundColor:cubit.colorscreen,
      //Colors.white.withOpacity(0.9), //Color(0xffC8B1E6),
      body: SafeArea(
        child: BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.separated(

            itemCount: cubit.categories.length,
            itemBuilder: (context,index)=> Padding(
              padding: const EdgeInsets.all(8.0),
              child:  GestureDetector(
                onTap: (){
                  cubit.cat=cubit.categories[index]["cat"];
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homeScreen()));
                },
             child:
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only( topRight:  Radius.circular(40)),
                      image: DecorationImage(
                           colorFilter: ColorFilter.mode(cubit.categories[index]["color"].withOpacity(0.1), BlendMode.color),
                          image:AssetImage(cubit.categories[index]["image"],),
                          fit: BoxFit.fill
                      ),
                         color: cubit.categories[index]["color"]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(

                      children: [
                        Icon(cubit.categories[index]["icon"],size: 35,color: Colors.white,),
                        SizedBox(width: MediaQuery.of(context).size.width*.03,),
                        Text(cubit.categories[index]["title"],style: const TextStyle(
                            color:Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ), separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20,) ;},),
      ),
    );
  },
),
      ),
    );
  }
}
