// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:provider/provider.dart';

class sorce extends StatefulWidget {


  const sorce({Key? key})
      : super(key: key);

  @override
  State<sorce> createState() => _sorceState();
}

class _sorceState extends State<sorce> {

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return cubit.load? Center(child: CircularProgressIndicator(),):Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.13,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: cubit.indexSorce == index
                          ? Colors.deepOrange
                          : context.read<CategoryCubit>().colorscreen,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.deepOrange, width: 2)),
                  child: Text(
                    "${cubit.sorce[index]["name"]}",
                    style: TextStyle(
                        color: context.read<CategoryCubit>().colortext,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  cubit.getlist(
                      cat: cubit.cat, scr: cubit.sorce[index]["Url"]);
                  cubit.changeSorceindex(newindex:index );
                },
              );
            },
            itemCount: cubit.sorce.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              );
            },
          ),
        );
      },
    );
  }
}
