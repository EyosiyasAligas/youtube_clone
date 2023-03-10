import 'dart:math';

import 'package:intl/intl.dart';
import 'package:youtube_api/youtube_api.dart';

class ApiConstant {
  static const String apiKey = 'Enter Your API KEY';
  static List<YouTubeVideo> videos = [];
  static final YoutubeAPI yt =  YoutubeAPI(apiKey, maxResults: 6, type: 'video, channel, playlist');
}

class Views {
  static int random(final int min, final int max) {
    return min + Random().nextInt(max - min);
  }

  static String formatNumber(final int number) {
    NumberFormat numberFormat = NumberFormat.compact();

    return numberFormat.format(number);
  }

}
