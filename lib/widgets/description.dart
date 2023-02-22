import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.video}) : super(key: key);

  final YouTubeVideo video;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        border: Border(
          top: BorderSide(
            color: Colors.white24,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[700],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Likes'),
                      const Text('views'),
                      Text(video.publishedAt!.substring(0, 9).toString()),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 10),
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView(
              children: [
                Text(video.description.toString()),
              ],
            ),
          ),
          Container(
            height: 6,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
