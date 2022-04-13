class Utils {
  static bool isPsuMail(String email) {
    if (email.split("@").last == "phuket.psu.ac.th") {
      return true;
    } else {
      return false;
    }
  }

  static String getImageUrlFormat(String url) {
    String googleDriveUrl = "https://drive.google.com/uc?export=view&id=";
    List<String> afterSplit = url.split("=");
    return googleDriveUrl + afterSplit.last;
  }
}
