import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit_state/app_cubit.dart';
import 'package:todo_app/cubit/cubit.dart';
import 'package:todo_app/network/dio_helper.dart';
import 'package:todo_app/screens/search_screen.dart';

import '../cubit/states.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.screenTitle[cubit.val]),
            actions: [
              ///search icon
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: IconButton(
                  icon: Icon(
                    size: 30,
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                ),
              ),

              ///light / dark mood icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: Icon(
                    size: 30,
                    AppCubit.get(context).isDark
                        ? Icons.brightness_2_rounded
                        : Icons.brightness_5_outlined,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                ),
              ),
            ],
          ),
          body: cubit.screenToggle[cubit.val],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeValue(index);
            },
            elevation: 10,
            currentIndex: cubit.val,
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
