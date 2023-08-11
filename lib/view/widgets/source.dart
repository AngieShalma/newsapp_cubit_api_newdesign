// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';
import 'package:provider/provider.dart';

class sourceScreen extends StatefulWidget {


  const sourceScreen({Key? key})
      : super(key: key);

  @override
  State<sourceScreen> createState() => _sourceScreenState();
}

class _sourceScreenState extends State<sourceScreen> {

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return cubit.load? Center(child: CircularProgressIndicator(color: Colors.purple,),):Container(
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
                      color: cubit.indexSource == index
                          ? Colors.purple
                          : context.read<CategoryCubit>().colorscreen,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text(
                    "${cubit.source[index]["name"]}",
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
                      cat: cubit.cat, scr: cubit.source[index]["Url"]);
                  cubit.changeSorceindex(newindex:index );
                },
              );
            },
            itemCount: cubit.source.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              );
            },
          ),
        );
      },
    );
  }
}
