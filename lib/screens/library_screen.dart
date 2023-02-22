import 'package:flutter/material.dart';

import '../widgets/custom_silver_appbar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: [
          const CustomSilverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Center(child: Text('Library'));
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
