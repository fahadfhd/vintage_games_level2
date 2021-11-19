import 'package:flutter/material.dart';
import 'package:vintage_games_level2/model/game_models.dart';

class CustomDelegate extends SearchDelegate<String> {
  List<String?> data = GameModelList;
  VoidCallback? onSuccess;

  CustomDelegate({this.onSuccess});
  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    if (query.isNotEmpty)
      listToShow =
          data.where((e) => e!.contains(query) && e.startsWith(query)).toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onTap: () {
            onSuccess!();
            close(context, noun);
          },
        );
      },
    );
  }
}
