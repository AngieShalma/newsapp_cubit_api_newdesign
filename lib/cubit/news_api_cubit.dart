import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'news_api_state.dart';

class NewsApiCubit extends Cubit<NewsApiState> {
  NewsApiCubit() : super(NewsApiInitial());
  List dataGeneral = [];
  List dataSports = [];
  List dataHealth = [];
  List dataBusiness = [];
  List dataentertainment = [];
  List dataScience = [];
  List datatechnology = [];
  List datalist = [];
  List keep = [];
  bool loading = true;
  int index = 0;
  changeIndex(index) {
    this.index = index;
    emit(state);
  }
  String AppBarName = "News App";
  changename(name) {
    AppBarName = name;
    emit(state);
  }
  bool load = true;
  getdata({required String cat}) async {
    load = true;
    emit(state);
    print('start');
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {
      if (cat == "general") {
        print(json.decode(res.body));
        dataGeneral = json.decode(res.body)["sources"];

        emit(state);
      } else
      if (cat == "sports") {
        dataSports = json.decode(res.body)["sources"];
        emit(state);
      } else
      if (cat == "health") {
        dataHealth = json.decode(res.body)["sources"];
        emit(state);
      } else
      if (cat == "business") {
        dataBusiness = json.decode(res.body)["sources"];
        emit(state);
      } else
      if (cat == "entertainment") {
        dataentertainment = json.decode(res.body)["sources"];
        emit(state);
      } else
      if (cat == "science") {
        dataScience = json.decode(res.body)["sources"];
        emit(state);
      } else
      if (cat == "technology") {
        datatechnology = json.decode(res.body)["sources"];
        emit(state);
      }
    }
    else{
      print(json.decode(res.body));
      print('jfhdjfhjdhf');
    }
    load = false;
    emit(state);
  }
  getlist({required String cat, required scr}) async {
    loading = true;
    datalist = [];
    emit(state);
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1&source=$scr"));
    if (res.statusCode == 200) {
      datalist = jsonDecode(res.body)["articles"];
    }
    print(datalist);
    loading = false;
    emit(state);
  }
  searchdata({required String q}) async {
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$q&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {
      datalist = jsonDecode(res.body)["articles"];
      emit(state);
    }
    emit(state);
  }
  emptydatalist() {
    keep = datalist;
    datalist = [];
    loading != null;
    emit(state);
  }
  keepdata() {
    datalist = keep;
   emit(state);
  }
}
