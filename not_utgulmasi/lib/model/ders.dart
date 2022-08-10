class ders {
  final String ad;
  final double harfDegeri;
  final double krediDegeri;

  ders({required this.ad, required this.harfDegeri, required this.krediDegeri});

  @override
  String toString() {
    return "$ad $harfDegeri $krediDegeri";
  }
}
