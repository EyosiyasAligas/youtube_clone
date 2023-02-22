import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone2/api_constant.dart';

class YtApi extends StatelessWidget {
  const YtApi({
    Key? key,
    required this.video,
  }) : super(key: key);

  final YouTubeVideo video;

  int random(final int min, final int max) {
    return min + Random().nextInt(max - min);
  }

  String formatNumber(final int myNumber, BuildContext context) {
    final NumberFormat numberFormat = NumberFormat.compact();

    return numberFormat.format(myNumber);
  }

  Widget videoCard(BuildContext context) {

    final views = Views.random(1000000, 100000000);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      color: Colors.black,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 3,
              width: double.infinity,
              color: Colors.grey[800],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.center,
                      heightFactor: 0.7,
                      child: Image.network(
                        video.thumbnail.high.url.toString(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 6,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        video.duration.toString(),
                        style: const TextStyle(fontSize: 11),
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                  child: CircleAvatar(
                    child: Image.network(
                      video.thumbnail.small.url.toString(),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 2),
                      width: MediaQuery.of(context).size.width - 130,
                      child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          video.channelTitle.length > 20
                              ? video.channelTitle.substring(0, 20)
                              : video.channelTitle,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.values[4],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: const Text(
                            '•',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Text(
                          formatNumber(views, context),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.values[4],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: const Text(
                            '•',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        timeCreator(
                          context,
                          DateTime.parse(
                            video.publishedAt.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text timeCreator(BuildContext ctx, DateTime dov) {
    DateTime time1 = DateTime.parse(dov.toString());
    return Text(
      timeago.format(time1),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.values[4],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return videoCard(context);
  }
}
