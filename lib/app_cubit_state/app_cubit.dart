import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared_pref/cache_helper.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? boolFromShared}) {
    if (boolFromShared != null) {
      isDark = boolFromShared;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      CasheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}
