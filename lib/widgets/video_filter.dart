import 'package:flutter/material.dart';

class VideoFilter extends StatelessWidget {
  const VideoFilter(
      {Key? key,
      required this.title,
      required this.selected,
      required this.index})
      : super(key: key);

  final String title;
  final int selected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return title == 'drawer'
        ? Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white12),
                  color: Colors.white10,
                ),
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.explore_outlined),
                ),
              ),
              Container(
                height: 37,
                width: 1,
                margin: const EdgeInsets.only(left: 15, right: 5,),
                color: Colors.grey[700],
              ),
            ],
          )
        : Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: Colors.white24),
              color: selected == index ? Colors.white : Colors.white10,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: selected == index ? Colors.black : Colors.white,
                ),
              ),
            ),
          );
  }
}
