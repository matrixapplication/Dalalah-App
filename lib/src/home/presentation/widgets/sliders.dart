import 'package:flutter/material.dart';

///  Created by harbey on 9/5/2023.
class Sliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    return CustomScrollView(
      controller: _controller,
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          collapsedHeight: 90,
          stretch: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.transparent,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                'https://i.pinimg.com/originals/0f/6a/9e/0f6a9e4b6b0b5b6b3b0b5b6b3b0b5b6b.jpg',
                fit: BoxFit.cover,
              ),
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.all(24),
              title:  Title(title: 'Ariana Grande', color: Colors.red, child: SizedBox(),),
            ),
          ),
        ),
        // Used to get the stretch effect to not be above the SliverAppBar
        const SliverToBoxAdapter(),
        SliverAppBar(
          backgroundColor: Colors.black,
          toolbarHeight:  kToolbarHeight,
          title: Column(
            children: [
              SizedBox(height: 5),
           //   const ChoiceTab(),
            ],
          ),
          primary: false,
          pinned: true,
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //       return SongTile(
        //         index: index,
        //       );
        //     },
        //     childCount: listArianaGrandeAlbums.length,
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
  }
}
