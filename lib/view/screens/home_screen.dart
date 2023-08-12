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

    Future.delayed(const Duration(),()async{
      await  context.read<CategoryCubit>().getsorce(cat:context.read<CategoryCubit>().cat);
      await context.read<CategoryCubit>().getlist(cat:context.read<CategoryCubit>().cat,
          scr:context.read<CategoryCubit>().source[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    double height=MediaQuery.of(context).size.height;//816.0
    double width=MediaQuery.of(context).size.width;//432.0
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
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
                    child:  Center(
                      child: Text(cubit.title,
                        style: const TextStyle(
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
          drawer: const drawer(),
          body:  SafeArea(
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
