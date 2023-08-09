part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class changeCategoriesindexState extends CategoryState {}

class changeSorceindexState extends CategoryState {}


class StartLoadingFor_getdata_state extends CategoryState {}
class GetDataFromApi extends CategoryState {}
class EndLoadingFor_getdata_state extends CategoryState {}

class StartLoadingFor_getlist_state extends CategoryState {}
class GetDataListFromApi extends CategoryState {}
class EndLoadingFor_getlist_state extends CategoryState {}

class StartLoadingSearchState extends CategoryState {}
class GetSearchDataFromApi extends CategoryState {}
class EndLoadingSearchState extends CategoryState {}

