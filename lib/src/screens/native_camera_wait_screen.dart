
import 'package:btcc/src/state/camera_store.dart';
import 'package:btcc/src/utils/image_helper.dart';
import 'package:btcc/src/utils/navigation_helper.dart';
import 'package:btcc/src/utils/typedefs.dart';
import 'package:flutter/material.dart';

class NativeCameraWaitScreen extends StatelessWidget {

  final AddCastleToGameCallback addCastleCallback;
  final int numPicturesTaken;
  NativeCameraWaitScreen({
    @required this.addCastleCallback,
    @required this.numPicturesTaken,
  });



  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String path = await CameraStore.takePictureNative();

      if (path == null) {
        Navigator.of(context).pop();
        return;
      }

      var rotation = await ImageHelper.getImageRotation(path);

      NavigationHelper.goToPreCastleScreen(context, path,
        rotation: rotation,
        replace: true,
        addCastleCallback: addCastleCallback,
        numPicturesTaken: numPicturesTaken+1,
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Waiting to take a picture with the camera...')
          ],
        ),
      ),
    );
  }
}
