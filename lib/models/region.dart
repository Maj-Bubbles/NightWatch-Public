class Region {
  String _location = "";
  String _name = "";

  String get location => _location;
  set location(value) {
    _location = value;
  }
  String get name => _name;
  set name(value) {
    _name = value;
  }

  // Should probably change return type before use :)
  dynamic downloadMedia() {}

}