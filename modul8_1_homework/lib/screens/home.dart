import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = "/";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                title: Text("sd"),
                bottom: TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.abc),
                    text: "sd",
                  ),
                  Tab(
                    icon: Icon(Icons.abc),
                    text: "sd",
                  ),
                ]),
              )
            ];
          },
          body: Container(),
        ),
      ),
    );
  }
}






/* 




CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text("Bosh saxifa"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Eng sara maxsulotlar"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const Card(
                child: ListTile(
                  title: Text("item"),
                ),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),






        child: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    expandedHeight: 0.0,
                    forceElevated: innerBoxIsScrolled,
                    stretch: true,
                    bottom: TabBar(
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(Icons.description, color: Theme.of(context).accentColor),
                        ),
                        Tab(
                          icon: Icon(Icons.timer, color: Theme.of(context).accentColor),
                        ),
                        Tab(
                          icon: Icon(Icons.ondemand_video, color: Theme.of(context).accentColor),
                        ),
                        Tab(
                          icon: Icon(Icons.photo_camera, color: Theme.of(context).accentColor),
                        ),
                      ],
                      controller: _tabController,
                    )
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabWidgets.map((Widget w) {
              return SafeArea(
                  top: false,
                  bottom: false,
                  child:  Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          ),
                          SliverFillRemaining(
                              child: w
                          )
                        ],
                      );
                    },
                  ));
            }).toList(),
            controller: _tabController,
          ),
        ));







CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Demo'),
      ),
    ),
    SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('Grid Item $index'),
          );
        },
        childCount: 20,
      ),
    ),
    SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('List Item $index'),
          );
        },
      ),
    ),
  ],
)


*/