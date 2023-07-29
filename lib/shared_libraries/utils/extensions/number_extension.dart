extension NumberExtension on int {
  String toK() {
    return '${(this / 1000).toStringAsFixed(1)}k';
  }

  String toTimeFormat() {
    int hours = this ~/ 60;
    int minutes = this % 60;
    return '${hours}h ${minutes}m';
  }
}
