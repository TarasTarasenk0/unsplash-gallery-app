extension StringExtension on String {
  String capitalize() {
    if (this == "") { return "";}
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
