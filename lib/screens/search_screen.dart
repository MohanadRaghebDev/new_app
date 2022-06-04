import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/cubit.dart';
import 'package:todo_app/cubit/states.dart';
import 'package:todo_app/widgets/article_item_widget.dart';

import '../app_cubit_state/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: const Text('search'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'search Must not be empty';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: AppCubit.get(context).isDark
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                    prefix: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              list.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            ArticleItemWidget(list[index], context),
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: Colors.pinkAccent[100],
                        ),
                        itemCount: list.length,
                      ),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text('Type Some Thing'),
                      ),
                    )
            ]),
          ),
        );
      },
    );
  }
}
