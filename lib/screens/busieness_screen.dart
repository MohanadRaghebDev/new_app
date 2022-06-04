import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/states.dart';

import '../cubit/cubit.dart';
import '../widgets/article_item_widget.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var article = NewsCubit.get(context).business;
          return state == NewsGetBusinessLoadingState()
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      ArticleItemWidget(article[index], context),
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    color: Colors.pinkAccent[100],
                  ),
                  itemCount: article.length,
                );
        });
  }
}
