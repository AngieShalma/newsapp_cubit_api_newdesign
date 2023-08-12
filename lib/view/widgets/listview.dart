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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return cubit.loading
            ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xff5C3C96),
          ),
        )
            : ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.1368421052631578947368421052632,
                      height:  MediaQuery.of(context).size.height * 0.16 ,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40), //topLeft:  Radius.circular(40)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff5C3C96).withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                              height:MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width * 0.3,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40)),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder:
                                "assets/images/placeholper_image.jpg",
                                fit: BoxFit.fill,
                                image:
                                "${cubit.listviewdata[index]["urlToImage"]}",
                                imageErrorBuilder: (a, b, c) {
                                  return Image.asset(
                                      "assets/images/placeholper_image.jpg");
                                },
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/1.9636363636363636363636363636364,
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${cubit.listviewdata[index]["title"]}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color:Color(0xff5C3C96)),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    "${cubit.listviewdata[index]["publishedAt"]}",
                                    style: const TextStyle(
                                        fontSize: 15, color: Color(0xff9570D0)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width/86.4,
                      top: MediaQuery.of(context).size.height/16.32,
                      child: InkWell(
                        onTap: () {
                          cubit.Url = cubit.listviewdata[index]["url"];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const web_screen()));
                        },
                        child:  PhysicalModel(
                          shadowColor:const Color(0xff5C3C96).withOpacity(0.5),
                          color: const Color(0xff5C3C96),
                          elevation: 15.0,
                          shape: BoxShape.circle,
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,

                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff5C3C96),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
              //   Divider(color:cubit.colortext
              // );
            },
            itemCount: cubit.listviewdata.length);
      },
    );
  }
}
