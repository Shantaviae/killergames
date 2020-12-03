class AppPolicy {
  final String title;
  final String description;
  final String content;
  final DateTime updatedAt;

  AppPolicy({
    required this.title,
    required this.description,
    required this.content,
    required this.updatedAt,
  });

  String get path => title.replaceAll(RegExp(r' '), '_').toLowerCase();
}
