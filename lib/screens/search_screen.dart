import 'package:flutter/material.dart';

import '../api_constant.dart';
import '../widgets/yt_api.dart';
import './videoplayer_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key,}) : super(key: key);


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String searched = '';
  var isLoaded = false;
  var results = ApiConstant.videos;

  Future<void> _getSearch(String searched) async {
    try {
      results = await ApiConstant.yt.search(searched, type: 'video, playlist', order: 'relevance');
      print(results);
      setState(() {
        isLoaded = true;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Search'),
        actions: [
          if (!isLoaded)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                  width: MediaQuery.of(context).size.width-120,
                  child: TextField(
                    showCursor: true,
                    autofocus: true,
                    enabled: true,
                    enableSuggestions: true,
                    autocorrect: true,
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.grey[200],
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search YouTube',
                      hintStyle: const TextStyle(fontSize: 14),
                      // fillColor: Colors.white10,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                    ),
                    onChanged: (val) {
                      setState(() {
                        searched = val;
                        print(searched);
                      });
                    },
                    onSubmitted: (val) => _getSearch(searched),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 7, 3),
                  child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.mic, color: Colors.white,),),),
                ),
              ],
            ),
          if (isLoaded)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                  alignment: Alignment.centerRight,
                  width: 200,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.grey[200],
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      label: Text(searched),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),
                      border: InputBorder.none,
                      hintText: 'Search YouTube',
                      hintStyle: const TextStyle(fontSize: 14),
                      // fillColor: Colors.white10,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isLoaded = false;
                          });
                        },
                        icon: const Icon(Icons.close, size: 20, color: Colors.white,),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searched = val;
                        print(searched);
                      });
                    },
                    onTap: () => searched = '',
                    onSubmitted: (val) => _getSearch(searched),
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.fromLTRB(0, 0, 7, 3),
                  child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.mic, color: Colors.white,),),),
                ),
                Container(

                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.cast, color: Colors.white, size: 22,),),
                ),
                Container(
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.white, size: 20,),),
                ),
              ],
            ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index)  {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayer(video:results[index], url: results[index].url)),
                );
              },
              child: YtApi(video: results[index],),
            );
          },
        ),
      ),
    );
  }
}
