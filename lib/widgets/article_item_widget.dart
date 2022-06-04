import 'package:flutter/material.dart';
import 'package:todo_app/web_view/web_view_screen.dart';

Widget ArticleItemWidget(article, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(url: article['url']),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(article['urlToImage'] ??
                        'https://image.shutterstock.com/image-vector/no-newspaper-icon-black-vector-600w-1734427751.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        article['title'],
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      article['publishedAt'],
                      style: Theme.of(context).textTheme.caption,
                      //
                      // style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
