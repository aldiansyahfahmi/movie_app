extension NumberExtension on int {
  String toK() {
    return '${(this / 1000).toStringAsFixed(1)}k';
  }
}
