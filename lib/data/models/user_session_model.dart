class UserSession {
  final int id;
  final int userId;
  final String token;
  final bool is2fa;
  final bool is2faAuthorized;
  final int lastUse;
  final int timestamp;

  UserSession({
    required this.id,
    required this.userId,
    required this.token,
    required this.is2fa,
    required this.is2faAuthorized,
    required this.lastUse,
    required this.timestamp,
  });

  factory UserSession.fromMap(Map<String, dynamic> session) {
    return UserSession(
      id: session['id'],
      userId: session['user_id'],
      token: session['token'],
      is2fa: session['2fa_required'] == 1,
      is2faAuthorized: session['2fa_authorized'] == 1,
      lastUse: session['timestamp_last_use'],
      timestamp: session['timestamp'],
    );
  }
}
