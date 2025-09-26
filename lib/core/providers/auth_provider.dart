import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _authToken;

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get authToken => _authToken;

  Future<bool> login(String email, String password) async {
    try {
      // TODO: Implement actual authentication logic with your backend
      // For now, using dummy credentials
      if (email == 'admin@portfolio.com' && password == 'password') {
        _isAuthenticated = true;
        _userEmail = email;
        _authToken = 'dummy_token_${DateTime.now().millisecondsSinceEpoch}';

        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    }
  }

  void logout() {
    _isAuthenticated = false;
    _userEmail = null;
    _authToken = null;
    notifyListeners();
  }

  // Check if user is still authenticated (e.g., token validation)
  Future<bool> checkAuthStatus() async {
    // TODO: Implement token validation with your backend
    // For now, just return current status
    return _isAuthenticated;
  }

  // Refresh authentication token
  Future<bool> refreshToken() async {
    try {
      // TODO: Implement token refresh logic
      if (_isAuthenticated) {
        _authToken = 'refreshed_token_${DateTime.now().millisecondsSinceEpoch}';
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Token refresh error: $e');
      return false;
    }
  }
}
