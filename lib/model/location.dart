class Location {
  final int x;
  final int y;
  const Location(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      other is Location && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  String toString() => '($x, $y)';
}
