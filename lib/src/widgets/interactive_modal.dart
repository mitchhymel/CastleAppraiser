import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

typedef ScreenshotWidgetBuilder = Widget Function(ScreenshotController);

class InteractiveModalWidget extends StatefulWidget {

  final Widget child;
  final ScreenshotWidgetBuilder builder;
  InteractiveModalWidget({@required this.child, this.builder});

  @override
  State createState() => _InteractiveModalWidgetState();

}

class _InteractiveModalWidgetState extends State<InteractiveModalWidget> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => Navigator.of(context).push(InteractiveModal(widget.child,
      screenshotController,
      widget.builder,
    )),
    child: widget.child,
  );
}

class InteractiveModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  final Widget content;
  final ScreenshotController screenshotController;
  final ScreenshotWidgetBuilder screenshotBuilder;
  InteractiveModal(this.content, this.screenshotController, this.screenshotBuilder);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,) 
  {
    if (screenshotBuilder != null) {
      print(' builder not null' );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
      body: InteractiveViewer(
        maxScale: 5.0,
        minScale: .2,
        child: Column(
          children: [
            Flexible(child: Container()),
            Screenshot(
              controller: screenshotController,
              child: content,
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
      floatingActionButton: screenshotBuilder == null ? null : screenshotBuilder(screenshotController),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}