class Utils {
  static bool isPsuMail(String email) {
    print(email.split("@").last);
    if (email.split("@").last == "phuket.psu.ac.th") {
      return true;
    } else {
      return false;
    }
  }
}
