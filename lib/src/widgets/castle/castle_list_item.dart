import 'package:auto_size_text/auto_size_text.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';

import 'castle_tiles_grid.dart';

class CastleListItem extends StatelessWidget {
  final Castle castle;
  final DeleteCastleCallback deleteCallback;
  final Key key;
  final Color color;
  CastleListItem({
    @required this.castle,
    @required this.deleteCallback,
    this.key,
    this.color=Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) => Material(
    elevation: 8.0,
    key: key != null ? key : Key('${castle.hiveCastle.key}'),
    borderRadius: BorderRadius.circular(20.0),
    color: color, // StatHelper.getColorBasedOnScore(castle.getScore()),
    child: InkWell(
      onTap: () => NavigationHelper.goToCastleScreen(context, castle,
        deleteCastleCallback: deleteCallback,
      ),
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${castle.getScore()}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  )
                ),
                Container(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/3),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: AutoSizeText('${castle.hiveCastle.title}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    maxLines: 3,
                  ),
                ),
              ]
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(child: Container()),
                  CastleTilesGrid(castle.castleTiles,
                    scalePercentScreenWidth: .5,
                  ),
                  Flexible(child: Container())
                ],
              )
            ),
            Icon(Icons.menu),
            Container(width: 8),
          ],
        )
      )
    )
  );
}