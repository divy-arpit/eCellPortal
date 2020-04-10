class Functions {
  String convertToStars(String s) {
    String result = "";
    int i, j;
    int l = s.length;
    for (i = 0; i < l; i++) {
      result = result + "*";
    }
    return result;
  }
}
