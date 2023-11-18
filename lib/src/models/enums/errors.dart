
class Error {

  static const Error TEST = Error._private('This is a test');
  static const Error NONE = Error._private('No errors');
  static const Error CAMERA_PERMISSION_DENIED = Error._private('Could not obtain camera permission');
  static const Error NO_CAMERAS_FOUND = Error._private('No cameras found');

  final String _message;
  const Error._private(this._message);

  @override
  String toString() {
    return this._message;
  }
}