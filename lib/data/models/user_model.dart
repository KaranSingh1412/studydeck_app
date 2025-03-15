class User {
  final int id;
  final int? companyId;
  final bool? emailVerified;
  final String? thirdParty;
  final String? plan;
  final int? timestamp;
  String? email;
  String? name;
  String? language;
  bool? is2fa;

  User({
    required this.id,
    this.companyId,
    this.email,
    this.name,
    this.emailVerified,
    this.is2fa,
    this.language,
    this.thirdParty,
    this.plan,
    this.timestamp,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    return User(
      id: user['id'],
      companyId: user['company_id'] == '0' ? null : user['company_id'],
      email: user['email'],
      emailVerified: user['email_verified'] == 1,
      is2fa: user['2fa'] == 1,
      language: user['language'],
      plan: user['plan'],
      thirdParty: user['third_party'],
      timestamp: user['timestamp'],
      name: user['name'],
    );
  }

  void set2Fa(bool newValue) {
    is2fa = newValue;
  }

  bool get isPro => plan == 'pro';

  bool get isCompany => companyId != null && companyId != 0;
}
