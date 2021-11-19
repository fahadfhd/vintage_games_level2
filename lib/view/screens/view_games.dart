import 'package:flutter/material.dart';

import 'package:vintage_games_level2/utils/extension.dart';

import 'package:flutter/services.dart';
import 'package:vintage_games_level2/view/delegate.dart';

class ViewGames extends StatefulWidget {
  const ViewGames({Key? key}) : super(key: key);

  @override
  State<ViewGames> createState() => _ViewGamesState();
}

class _ViewGamesState extends State<ViewGames> {
  String? _result = "";
  bool ress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            title: const Text("Vinatge_games"),
            floating: true,
            expandedHeight: 150,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  var result = await showSearch<String>(
                    context: context,
                    delegate: CustomDelegate(onSuccess: () {
                      setState(() {
                        ress = true;
                      });
                    }),
                  );
                  setState(() {
                    print(result);
                    print(ress);
                    _result = result;
                  });
                },
              )
            ],
          ),
          if (ress == false)
            SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(
                  15,
                  (index) {
                    return titleAndImages();
                  },
                )),
          if (ress == true)
            SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(
                  1,
                  (index) {
                    return resultOfSearch();
                  },
                )),
        ]));
  }

  Widget resultOfSearch() {
    return Card(
        color: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.only(left: 1, right: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 75,
                color: Colors.lightBlueAccent,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _result.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ));
  }
}

Widget titleAndImages() {
  return Card(
      color: Colors.blue[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 75,
              color: Colors.blue[400],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // -----placeholder titles --------------------
                  Align(alignment: Alignment.center, child: Text("retro")),
                  Image(
                    // -----change the images area----------
                    image: AssetImage('retro'.asAssetpng()),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
