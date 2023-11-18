
import 'package:flutter/foundation.dart';

List<String> logs = [];

log(dynamic x) {
  if (kDebugMode) {
    print(x);
  }

  logs.add('${DateTime.now().toString()}: ${x.toString()}');
}

logNow({String tag = ''}) {
  String tagStr = tag == '' ? tag : '$tag:';
  log('$tagStr${DateTime.now().toString()}');
}