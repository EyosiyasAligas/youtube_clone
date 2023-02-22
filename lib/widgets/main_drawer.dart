import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      width: MediaQuery.of(context).size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('asset/YouTube_white.png', height: 80,),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.local_fire_department_outlined, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Trending')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.music_note_outlined, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Music')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.wifi_tethering, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Live')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.sports_esports_outlined, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Gaming')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.newspaper, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('News')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.sports, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Sports')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.lightbulb_outlined, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Learning')
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {  },
            child: Container(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: const [
                  Icon(Icons.music_note_outlined, color: Colors.white,),
                  SizedBox(width: 15,),
                  Text('Fashion & Beauty')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
