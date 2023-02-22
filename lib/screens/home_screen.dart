import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api_constant.dart';
import '../widgets/main_drawer.dart';
import '../widgets/yt_api.dart';
import '../widgets/custom_silver_appbar.dart';
import '../widgets/video_filter.dart';
import './videoplayer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoaded = false;
  var results = ApiConstant.videos;

  Future<void> _getTrends() async {
    if (!isLoaded) {
      try {
        results = await ApiConstant.yt.getTrends(regionCode: 'GB');
        print(results);
      } catch (e) {
        print(e);
      }
      isLoaded = true;
    }
  }

  final List l = [
    'drawer',
    'All',
    'Music',
    'Watched',
    'Gaming',
    'live',
    'Comedy',
    'Wildlife',
    'Tv Shows',
  ];

  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: _getTrends(),
        builder: (ctx, data) {
          return CustomScrollView(
            slivers: [
              const CustomSilverAppBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          color: Colors.black,
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: l.length,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selected = i;
                                  });
                                },
                                child: Row(
                                  children: [
                                    VideoFilter(
                                      title: l[i],
                                      selected: selected,
                                      index: i,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayer(
                              video: results[index],
                              url: results[index].url,
                            ),
                          ),
                        );
                      },
                      child: YtApi(
                        video: results[index],
                      ),
                    );
                  },
                  childCount: results.length,
                ),
              ),
            ],
          );
        },
      ),
      drawer: const DrawerScreen(),
    );
    // :  Container(
    //   color: Colors.black,
    //   child: const Center(
    //     child: SpinKitDualRing(
    //       color: Colors.white,
    //       size: 50,
    //     ),),);
  }
}
