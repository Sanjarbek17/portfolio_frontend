import 'package:flutter/material.dart';
import 'package:portfolio_frontend/pages/admin/pages/dashboard_page.dart';
import 'package:portfolio_frontend/pages/admin/pages/login_page.dart';

class AdminPage extends StatelessWidget {
  final bool isAuthenticated;

  const AdminPage({
    super.key,
    this.isAuthenticated = false,
  });

  @override
  Widget build(BuildContext context) {
    return isAuthenticated ? const AdminDashboardPage() : const AdminLoginPage();
  }
}
