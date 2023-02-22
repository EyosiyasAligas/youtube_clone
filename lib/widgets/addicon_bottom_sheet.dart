import 'package:flutter/material.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Text('Create', style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 15),),
              ),
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.clear, color: Colors.grey,)),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.play_arrow_outlined,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Create a Short', style: TextStyle(
                        color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.upload_sharp,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Upload a video', style: TextStyle(
                        color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.wifi_tethering,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Go live', style: TextStyle(
                        color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.person_sharp,),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Go Live Together', style: TextStyle(
                        color: Colors.white),),
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
