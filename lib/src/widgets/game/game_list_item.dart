import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/string_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/castle/castle_tiles_grid.dart';
import 'package:flutter/material.dart';

import '../async_confirmation_dialog.dart';


class GameListItem extends StatelessWidget {
  final Game game;
  final DeleteGameCallback deleteCallback;

  GameListItem({
    @required this.game,
    @required this.deleteCallback,
  });

  _onLongPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AsyncConfirmationDialog(
        confirmationText: 'Are you sure you want to delete this game (and all castles with it)?',
        progressText: 'Deleting game...',
        onPressedYes: () async {
          await deleteCallback(game);
          return 'Successfully deleted game!';
        },
      )
    );
  }

  _getFlexibleCastleView(BuildContext context, Castle castle) => Flexible(
    child: Column(
      children: [
        Text(castle.hiveCastle.title),
        Text(castle.getScore().toString()),
        Row(
          children: [
            Flexible(child: Container()),
            CastleTilesGrid(castle.castleTiles,
              scalePercentScreenWidth: .4,
            ),
            Flexible(child: Container()),
          ],
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {

    var pair = game.getWinningCastle();

    List<Widget> children = [
      Text('${StringHelper.getMonthDayYear(game.hiveGame.created)}'),
      Container(height:10),
    ];

    if (pair != null) {
      var left = pair.key;
      var right = pair.value;

      children.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getFlexibleCastleView(context, left),
          Container(width:10),
          _getFlexibleCastleView(context, right),
        ],
      ));
    }
    else {
      children.addAll([
        Text('Not enough castles to determine a winner'),
        Container(height: 50),
      ]);
    }

    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () => NavigationHelper.goToGameEditScreen(context,
          game: game,
        ),
        onLongPress: () => _onLongPress(context),
        child: Column(
          children: children,
        ),
      )
    );
  }

}