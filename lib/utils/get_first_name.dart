String getFirstNameFromNames(String fullName) {
  List<String> names = fullName.split(' ');

  if (names.isNotEmpty) {
    return '${names.first}';
  } else {
    return "###-###";
  }
}
