class Country {
  final int id;
  final String name;
  final String code;
  final String telCode;
  final String? timezone;
  final String flag;
  final String createdAt;
  final String updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.telCode,
    this.timezone,
    required this.flag,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      telCode: json['tel_code'],
      timezone: json['timezone'],
      flag: json['flag'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
