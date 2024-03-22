class TermsAndConditions {
  final int id;
  final String title;
  final String content;
  final String publishedAt;
  final bool enabled;
  final String createdAt;
  final String updatedAt;

  TermsAndConditions({
    required this.id,
    required this.title,
    required this.content,
    required this.publishedAt,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TermsAndConditions.fromJson(Map<String, dynamic> json) {
    return TermsAndConditions(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      publishedAt: json['published_at'],
      enabled: json['enabled'] == 1,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
