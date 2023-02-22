import 'package:flutter/material.dart';

import '../widgets/custom_silver_appbar.dart';

class Shorts extends StatelessWidget {
  const Shorts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    body: CustomScrollView(
      slivers: [
        const CustomSilverAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index)  {
            return const Center(child: Text('Shorts'));
          },
            childCount: 1,
          ),
        ),
      ],
    ),
    );
  }
}
