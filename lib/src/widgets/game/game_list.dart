
import 'package:btcc/src/state/data_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_list_item.dart';

class GameList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<DataStore>(builder: (_, store, child) => ListView.builder(
    itemCount: store.games.length,
    itemBuilder: (_, int index) => Container(
      padding: const EdgeInsets.all(4),
      child: GameListItem(
        game: store.games[index],
        deleteCallback: (game) async {
          await store.deleteGame(game.hiveGame);
        }
      )
    ),
  ));
}