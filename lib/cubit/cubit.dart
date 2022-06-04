import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';
import '../network/dio_helper.dart';
import 'package:flutter/material.dart';
import '/screens/Science_Screen.dart';
import '/screens/busieness_screen.dart';
import '/screens/setting_screen.dart';
import '/screens/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  String apiKey = 'a7350846244f4e5fb87e8da5adc48cdb';
  int val = 0;
  List<Widget> screenToggle = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingScreen(),
  ];

  /// bottom bar items
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_baseball),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Setting',
    // ),
  ];

  /// list to change screen appbar title
  List<String> screenTitle = [
    'BusinessScreen',
    'SportsScreen',
    'ScienceScreen',
    // 'Setting Screen'
  ];

  ///
  void changeValue(int value) {
    val = value;
    emit(NewsChangeBottomBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': apiKey,
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print('error :$onError');
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': apiKey,
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((onError) {
      print('error :$onError');
      emit(NewsGetSportsErrorState(onError.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': apiKey,
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((onError) {
      print('error :$onError');
      emit(NewsGetScienceErrorState(onError.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': value,
      'apiKey': apiKey,
    }).then((value) {
      search = value.data['articles'];

      print('value : $value');
      print('value.date : ${value.data}');
      print('value.date[articles] : ${value.data['articles']}');
      print(
          'value.date[articles][urlToImage] : ${value.data['articles']['urlToImage']}');

      print(search);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print('error :$onError');
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }
}
