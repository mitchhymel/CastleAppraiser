

import 'package:btcc/src/models/exports.dart';
import 'package:flutter/material.dart';

import 'grid_expander.dart';

typedef ExpandCollapseCallback<T> = void Function(GridList<T>);
typedef CreateItemCallback<T> = T Function();
typedef GridItemBuilder<T> = Widget Function(BuildContext, T);
typedef ItemToBoolCallback<T> = bool Function(T);
typedef IndexItemCallback<T> = void Function(int, T);
typedef DragItemCallback = void Function(int);
typedef WidgetWrapper<T> = Widget Function(T, Widget);
typedef OnPictureTaken = void Function(String);
typedef GetDirCallback = Future<String> Function();
typedef WidgetCallback = Widget Function();
typedef AddCastleToGameCallback = Future<void> Function(Castle, String, int);
typedef DeleteCastleCallback = Future<void> Function(Castle);
typedef DeleteGameCallback = Future<void> Function(Game);
typedef RearrangedCastlesCallback = void Function(int, int);
typedef GetCastleColorCallback = Color Function(Castle);
typedef DragTargetAcceptWithScrollControllerCallback<T> = Function(DragTargetDetails<T>, ScrollController);