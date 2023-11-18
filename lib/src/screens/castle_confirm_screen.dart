import 'dart:io';

import 'package:btcc/src/analytics/analytics.dart';
import 'package:btcc/src/models/exports.dart';
import 'package:btcc/src/utils/grid_expander.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:btcc/src/widgets/background_container.dart';
import 'package:btcc/src/widgets/button_padding.dart';
import 'package:btcc/src/widgets/castle/castle_tiles_grid.dart';
import 'package:btcc/src/widgets/edit_text_dialog.dart';
import 'package:btcc/src/widgets/interactive_modal.dart';
import 'package:flutter/material.dart';

class CastleConfirmScreen extends StatelessWidget {

  final int numPicturesTaken;
  final GridList<Tile> castleTiles;
  final String imagePath;
  final AddCastleToGameCallback addCastleCallback;
  CastleConfirmScreen({
    @required this.castleTiles,
    @required this.imagePath,
    @required this.addCastleCallback,
    this.numPicturesTaken=0,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BackgroundContainer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                InteractiveModalWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height/4.5,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Center(child: Image.file(File(imagePath),
                          fit: BoxFit.fill,
                        ))
                      )
                    ],
                  )
                ),
                Container(
                  child: InteractiveModalWidget(
                    child: CastleTilesGrid(castleTiles,)
                  ),
                ),
                Flexible(child: Container()),
              ],
            ),
          ),
          Text('Is this correct?',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          ButtonPadding(),
          // RaisedButton(
          //   onPressed: () => BetterFeedback.of(context).show()
          // ),
          Row(
            children: [
              FloatingActionButton.extended(
                heroTag: 'picture',
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.camera_alt),
                label: Text('No, Redo'),
                onPressed: () => NavigationHelper.goToCameraExperience(
                  context,
                  addCastleCallback: addCastleCallback,
                  numPicturesTaken: numPicturesTaken,
                  replace: true
                )
              ),
              Flexible(child: Container()),
              FloatingActionButton.extended(
                heroTag: 'edit',
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.edit),
                label: Text('No, Edit'),
                onPressed: () {
                  NavigationHelper.goToCastleBuilderScreen(context, 
                    castleTiles: castleTiles,  
                    imagePath: imagePath,
                    replace: true,
                    addCastleCallback: addCastleCallback,
                    numPicturesTaken: numPicturesTaken,
                  );
                }
              ),
              Flexible(child: Container()),
              FloatingActionButton.extended(
                heroTag: 'castle',
                backgroundColor: Colors.green,
                icon: Icon(Icons.check),
                label: Text('Yes'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => EditTextDialog(
                      confirmationText: 'Give the castle a name',
                      onPressedYes: (str) async {
                        var castle = new Castle(castleTiles);
                        castle.title = str;
                        await addCastleCallback(castle, imagePath, numPicturesTaken);

                        Analytics.logCastleSavedFromPicture(numPicturesTaken);

                        Navigator.pop(context);
                      }
                    )
                  );
                }
              ),
            ]
          ),
          ButtonPadding(),
        ],
      )
    )
  );
}