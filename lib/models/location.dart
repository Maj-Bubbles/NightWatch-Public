class Location {
  String _location = "";
  String _providedLoc = "";

  String get location => _location;
  set location(String value) {
    _location = value;
  }

  String get providedLoc => _providedLoc;
  set providedLoc(String value) {
    _providedLoc = value;
  }

  // Should probably change return type before use :)
  dynamic getPreview() {}
}