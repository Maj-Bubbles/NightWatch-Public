class Media {
  String _reportID = "";
  String _fileStorageURL = "";
  
  String get reportID => _reportID;
  set reportID(String value) => _reportID = value;

  String get fileStorageURL => _fileStorageURL;
  set fileStorageURL(String value) => _fileStorageURL = value;

  Media(String reportId) {
    _reportID = reportId;
  }

  // Should possibly change return type
  dynamic downloadMedia() {}
  
}