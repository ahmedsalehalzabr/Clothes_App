class ApiEndPoints {
  static final String baseUrl = 'https://10.0.2.2:7289/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'Auth/register';
  final String loginEmail = 'Auth/login';
}