extension ImagePath on String {
  String get toPNG => 'assets/$this.png';
  String get toJPG => 'assets/$this.jpg';
}
