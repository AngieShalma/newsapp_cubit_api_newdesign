
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  int index=0;

  List categories= [
    {"image":"assets/images/environment.jpeg","title":"general","color":Colors.purple,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/sports.jpeg","title":"sports","color":Colors.red,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/health.jpeg","title":"health","color":Colors.pinkAccent,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/buisness.jpeg","title":"business","color":Colors.brown,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/entertainment.jpeg","title":"entertainment","color":Colors.blue,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/science.jpeg","title":"science","color":Colors.amber,"icon":Icon(Icons.health_and_safety)},
    {"image":"assets/images/technology.jpeg","title":"technology","color":Colors.cyan,"icon":Icon(Icons.health_and_safety)},
  ];
  bool colormode=false;
  Color colorscreen=Colors.white;
  Color colorDate=Colors.grey;
  Color colortext=Colors.black;
  Color colorappbar=Colors.deepOrange;
  changemode(){
    colorscreen=colormode==true ?Colors.white:Colors.black12;
    emit(state);
    colortext=colormode==true ?Colors.black:Colors.white;
    emit(state);
    colorDate=colormode==true ?Colors.grey:Colors.white38;
    emit(state);
    colormode=!colormode;
    emit(state);
  }


  changeindex({required newindex}){
    index=newindex;
    emit(changeindexState());
  }
}
