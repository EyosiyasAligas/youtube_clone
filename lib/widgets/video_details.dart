import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../api_constant.dart';
import './description.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key, required this.video}) : super(key: key);

  final YouTubeVideo video;

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  var isSubscribed = false;

  void subscribed() {
    setState(() {
      isSubscribed = !isSubscribed;
    });
  }

  description() {
    return showModalBottomSheet(
        isScrollControlled: true,
        // isDismissible: false,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.70,
        ),
        elevation: 0,
        barrierColor: null,
        context: context,
        builder: (context) {
          return Description(
            video: widget.video,
          );
        });
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
    var size = MediaQuery.of(context).size;
    final views = Views.random(1000000, 100000000);
    return Container(
      height: size.height * 0.67,
      child: Column(
        children: [
          InkWell(
            onTap: description,
            child: Container(
              width: double.infinity,
              color: Colors.black45,
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Text(
                      widget.video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Text(
                          Views.formatNumber(views),
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 10,
                            fontWeight: FontWeight.values[4],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        timeCreator(
                          context,
                          DateTime.parse(
                            widget.video.publishedAt.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '...more',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7,
              ),
              color: Colors.black45,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.network(
                      widget.video.thumbnail.small.url.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: size.width * 0.77,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.video.channelTitle,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.values[4],
                          ),
                        ),
                        isSubscribed
                            ? ElevatedButton(
                                onPressed: subscribed,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white10,
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black,
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        18.0,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.notifications_none,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            : ElevatedButton(
                                onPressed: subscribed,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black,
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        18.0,
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
