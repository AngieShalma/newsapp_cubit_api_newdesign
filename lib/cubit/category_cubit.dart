
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List categories= [
    {"image":"assets/images/environment.jpeg","title":"general","color":Colors.grey,"icon":Icon(Icons.health_and_safety),"cat":"general"},
    {"image":"assets/images/sports.jpeg","title":"sports","color":Colors.red,"icon":Icon(Icons.health_and_safety),"cat":"sports"},
    {"image":"assets/images/health.jpeg","title":"health","color":Colors.brown,"icon":Icon(Icons.health_and_safety),"cat":"health"},
    {"image":"assets/images/buisness.jpeg","title":"business","color":Colors.brown,"icon":Icon(Icons.health_and_safety),"cat":"business"},
    {"image":"assets/images/entertainment2.jpeg","title":"entertainment","color":Colors.yellow,"icon":Icon(Icons.health_and_safety),"cat":"entertainment"},
    {"image":"assets/images/science.jpeg","title":"science","color":Colors.purpleAccent,"icon":Icon(Icons.health_and_safety),"cat":"science"},
    {"image":"assets/images/technology.jpeg","title":"technology","color":Colors.cyan,"icon":Icon(Icons.health_and_safety),"cat":"technology"},
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

  bool load = true;
  List sorce=[];
  late String cat;
  getsorce({required String cat}) async {
    load = true;
    emit(StartLoadingFor_getdata_state());
    print('start');
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {

      sorce = json.decode(res.body)["sources"];
      print(sorce.length);
        emit(GetDataFromApi());
    }
    else{
      print(json.decode(res.body));
      print('jfhdjfhjdhf');
    }
    load = false;
    emit(EndLoadingFor_getdata_state());
  }

  bool loading = true;
  List listviewdata=[];
  late String Url;
  getlist({required String cat, required scr}) async {
    print("startgetlist");
    loading = true;
    listviewdata = [];
    emit(StartLoadingFor_getlist_state());
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1&source=$scr"));
    if (res.statusCode == 200) {
      listviewdata = jsonDecode(res.body)["articles"];
      print(listviewdata.length);
      emit(GetDataListFromApi());
    }else{
      print(json.decode(res.body));
      print('no data');
    }

    loading = false;
    emit(EndLoadingFor_getlist_state());
  }

  List Searchlist=[];
  bool loadingSearch = true;
  searchdata({required String q}) async {
    loadingSearch=true;
    emit(StartLoadingSearchState());
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$q&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {
      Searchlist = jsonDecode(res.body)["articles"];
      emit(GetSearchDataFromApi());
    }
    loadingSearch=false;
    emit(EndLoadingSearchState());
  }

  int indexCategories=0;
  changeCategoriesindex({required newindex}){
    indexCategories=newindex;
    emit(changeCategoriesindexState());
  }

  int indexSorce=0;
  changeSorceindex({required newindex}){
    indexSorce=newindex;
    emit(changeSorceindexState());
  }
}
