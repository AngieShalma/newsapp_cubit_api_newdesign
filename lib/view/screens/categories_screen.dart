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
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  navegate(index){
    context.read<CategoryCubit>().title=context.read<CategoryCubit>().categories[index]["title"];
    context.read<CategoryCubit>().cat=context.read<CategoryCubit>().categories[index]["cat"];
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const homeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    double height=MediaQuery.of(context).size.height;//816.0
    double width=MediaQuery.of(context).size.width;//432.0

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: const drawer(),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                PreferredSize(
                  preferredSize:  Size.fromHeight(kToolbarHeight + (height/4.08)),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Opacity(
                        opacity: .5,
                        child: ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                            color: const Color(0xff9873D3),
                            height: (height/3.709090909090909),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color(0xff5C3C96),
                          height: (height/4.08),
                          child: const Center(
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: (width/21.6), vertical: (height/20.4)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () =>
                                    _scaffoldKey.currentState?.openDrawer(),
                                child: const Icon(
                                  Icons.menu,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  search()));
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: (height/3.709090909090909),
                  left: (width/4.32),
                  child: InkWell(
                    onTap:()=>navegate(0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/2.88),
                      height: (height/5.44),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${cubit.categories[0]["icon"]}",
                            fit: BoxFit.fill,),
                          Text(cubit.categories[0]["title"]
                            ,style: const TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: (height/27.2),
                  right: (width/21.6),
                  child: InkWell(
                    onTap: ()=>navegate(1),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/4.32),
                      height: (height/8.16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${cubit.categories[1]["icon"]}"
                            ,fit: BoxFit.fill,
                            height: (height/16.32),
                            width: (width/8.64),
                          ),
                          Text(cubit.categories[1]["title"]
                            ,style: const TextStyle(
                                color:Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (height/2.72),
                  right: (width/21.6),
                  child: InkWell(
                    onTap:()=>navegate(2),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/2.2736842105263157894736842105263),
                      height: (height/4.2947368421052631578947368421053),
                      child: Padding(
                        padding:  EdgeInsets.only(
                            top: (height/27.2),
                            left:(width/19.636363636363636363636363636364)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("${cubit.categories[2]["icon"]}",
                              fit: BoxFit.fill,),
                            Text(cubit.categories[2]["title"]
                              ,style: const TextStyle(
                                  color:Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: (height/27.2),
                  left: (width/21.6),
                  child: InkWell(
                    onTap: ()=>navegate(4),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/2.88),
                      height: (height/5.44),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("${cubit.categories[4]["icon"]}",
                              fit: BoxFit.fill,
                              height: (height/11.571428571428571428571428571429),
                              width: (width/6.1714285714285714285714285714286),
                            ),
                            Text(cubit.categories[4]["title"]
                              ,style: const TextStyle(
                                  color:Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: (height/10.88),
                  right: (width/3.6),
                  child: InkWell(
                    onTap: ()=>navegate(3),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/3.3230769230769230769230769230769),
                      height: (height/6.2769230769230769230769230769231),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${cubit.categories[3]["icon"]}",
                            fit: BoxFit.fill,
                            height: (height/11.657142857142857142857142857143),
                            width: (width/6.1714285714285714285714285714286),
                          ),
                          Text(cubit.categories[3]["title"]
                            ,style: const TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (width/43.2),
                  top: (height/2.72),
                  child: InkWell(
                    onTap: ()=>navegate(6),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width: (width/3.6),
                      height: (height/6.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${cubit.categories[6]["icon"]}",
                            fit: BoxFit.fill,
                            height: (height/13.6),
                            width: (width/7.2),
                          ),
                          Text(cubit.categories[6]["title"]
                            ,style: const TextStyle(
                                color:Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: (height/2.1473684210526315789473684210526),
                  left: (width/8.64),
                  child: InkWell(
                    onTap: ()=>navegate(5),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(

                        gradient: RadialGradient(
                            radius: .8,
                            colors: [

                              Color(0xffC393FF),

                              Color(0xff9570D0),

                              Color(0xff7A57B4),

                              Color(0xff5C3C96),

                              Color(0xff55368F),

                              Color(0xff20095C),
                            ]
                        ),
                        //color:cubit.categories[0]["color"],
                        shape: CircleBorder(
                          side: BorderSide(width: 1, color:Colors.transparent),
                        ),
                      ),
                      width:(width/1.728) ,
                      height:(height/3.264) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${cubit.categories[5]["icon"]}",
                            fit: BoxFit.fill,),
                          Text(cubit.categories[5]["title"]
                            ,style: const TextStyle(
                                color:Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.5, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
    Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEndt = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEndt.dx, secondEndt.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

