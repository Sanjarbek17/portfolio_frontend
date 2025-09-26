import 'package:get/get.dart';

class AdminHelper {
  static void navigateToAdmin() {
    Get.toNamed('/admin');
  }

  static void navigateToAdminDashboard() {
    Get.toNamed('/admin/dashboard');
  }

  static void navigateToCreateProject() {
    Get.toNamed('/admin/projects/create');
  }

  static void navigateToEditProject({Map<String, dynamic>? projectData}) {
    Get.toNamed('/admin/projects/edit', arguments: projectData);
  }

  static void goBackToFrontend() {
    Get.offAllNamed('/frontend');
  }
}