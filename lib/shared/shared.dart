class SharedDetails {
  static String? capitalize(String? inputString) {
    if (inputString != null) {
      return inputString[0].toUpperCase() + inputString.substring(1);
    }
    return null;
  }
}
