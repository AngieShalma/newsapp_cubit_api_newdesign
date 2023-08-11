import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List categories= [
    {"image":"assets/images/environment.jpeg","title":"general","color":Colors.grey,"icon":Icons.find_in_page,"cat":"general"},
    {"image":"assets/images/sports.jpeg","title":"sports","color":Colors.purple,"icon":Icons.sports,"cat":"sports"},
    {"image":"assets/images/health.jpeg","title":"health","color":Colors.transparent,"icon":Icons.health_and_safety,"cat":"health"},
    {"image":"assets/images/buisness.jpeg","title":"business","color":Colors.brown,"icon":Icons.business,"cat":"business"},
    {"image":"assets/images/entertainment2.jpeg","title":"entertainment","color":Colors.yellow,"icon":Icons.celebration,"cat":"entertainment"},
    {"image":"assets/images/science.jpeg","title":"science","color":Colors.purpleAccent,"icon":Icons.science,"cat":"science"},
    {"image":"assets/images/technology.jpeg","title":"technology","color":Colors.cyan,"icon":Icons.biotech,"cat":"technology"},
  ];
  bool colormode=false;
  Color colorscreen=Colors.white10;
  Color colorDate=Colors.grey;
  Color colortext=Colors.black;
  Color colorappbar=Colors.purple;
  changemode(){
    colorscreen=colormode==true ?Colors.white:Colors.black12;
    emit(changeScreenColorState());
    colortext=colormode==true ?Colors.black:Colors.white;
    emit(changeTextColorState());
    colorDate=colormode==true ?Colors.grey:Colors.white38;
    emit(changeDateColorState());
    colormode=!colormode;
    emit(changeColorModeState());
  }

  bool load = true;
  List source=[];
  late String cat;
  getsorce({required String cat}) async {
    load = true;
    emit(StartLoadingFor_getdata_state());
    print('start');
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {

      source = json.decode(res.body)["sources"];
      print(source.length);
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

  int indexSource=0;
  changeSorceindex({required newindex}){
    indexSource=newindex;
    emit(changeSorceindexState());
  }
}
