import 'package:flutter/foundation.dart';
import '../models/admin_project_model.dart';

class AdminProjectProvider extends ChangeNotifier {
  final List<AdminProjectModel> _projects = [];
  bool _isLoading = false;
  String? _error;

  List<AdminProjectModel> get projects => List.unmodifiable(_projects);
  List<AdminProjectModel> get publishedProjects => _projects.where((p) => p.status == 'Published').toList();
  List<AdminProjectModel> get draftProjects => _projects.where((p) => p.status == 'Draft').toList();

  bool get isLoading => _isLoading;
  String? get error => _error;

  int get totalProjects => _projects.length;
  int get publishedCount => publishedProjects.length;
  int get draftCount => draftProjects.length;

  AdminProjectProvider() {
    _loadDemoData();
  }

  void _loadDemoData() {
    final now = DateTime.now();
    _projects.addAll([
      AdminProjectModel(
        id: '1',
        title: 'E-commerce Mobile App',
        description: 'Flutter-based mobile application for online shopping with payment integration',
        content: '''
# E-commerce Mobile App

A comprehensive mobile application built with Flutter that provides a complete online shopping experience.

## Features
- User authentication and profile management
- Product catalog with search and filtering
- Shopping cart and wishlist functionality
- Secure payment integration with Stripe
- Order tracking and history
- Push notifications for offers and updates
- Admin panel for inventory management

## Technical Implementation
The app follows clean architecture principles with proper separation of concerns. State management is handled using Provider pattern, and data persistence is achieved through local SQLite database with online synchronization.

## Challenges Faced
- Implementing secure payment processing
- Optimizing image loading and caching
- Handling offline functionality
- Managing complex state across multiple screens

## Key Learnings
This project taught me about scalable app architecture, payment gateway integration, and the importance of user experience in e-commerce applications.
        ''',
        githubUrl: 'https://github.com/example/ecommerce-app',
        liveUrl: 'https://play.google.com/store/apps/example',
        technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe', 'SQLite', 'Provider'],
        status: 'Published',
        category: 'Mobile Development',
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now.subtract(const Duration(days: 5)),
        imageUrls: ['assets/images/ecommerce-app-1.png', 'assets/images/ecommerce-app-2.png'],
      ),
      AdminProjectModel(
        id: '2',
        title: 'Portfolio Website',
        description: 'Personal portfolio website built with Flutter Web showcasing responsive design',
        content: '''
# Portfolio Website

A modern, responsive portfolio website built using Flutter Web to showcase my development projects and skills.

## Features
- Responsive design that works on desktop, tablet, and mobile
- Dark theme with smooth animations
- Project showcase with detailed descriptions
- Contact form with email integration
- Multi-language support (English/Russian)
- SEO optimized for better search visibility

## Technical Details
Built using Flutter Web with a clean, modular architecture. The site uses proper semantic HTML and follows accessibility guidelines. The responsive design is achieved using Flutter's built-in responsive widgets and custom breakpoint handling.

## Performance Optimizations
- Lazy loading of images and content
- Optimized build for web deployment
- Compressed assets and efficient caching
- Progressive loading for better user experience

This project demonstrates my ability to create professional web applications using Flutter's cross-platform capabilities.
        ''',
        githubUrl: 'https://github.com/example/portfolio-website',
        liveUrl: 'https://myportfolio.example.com',
        technologies: ['Flutter', 'Web', 'Dart', 'HTML/CSS', 'JavaScript'],
        status: 'Published',
        category: 'Web Development',
        createdAt: now.subtract(const Duration(days: 20)),
        updatedAt: now.subtract(const Duration(days: 2)),
        imageUrls: ['assets/images/portfolio-1.png', 'assets/images/portfolio-2.png'],
      ),
      AdminProjectModel(
        id: '3',
        title: 'Task Management App',
        description: 'Cross-platform task management application with team collaboration features',
        content: '''
# Task Management App

A comprehensive task management application designed for individuals and teams to organize, track, and complete their work efficiently.

## Current Features (In Development)
- Create, edit, and delete tasks
- Set priorities and due dates  
- Organize tasks into projects and categories
- Basic user authentication
- Local data storage

## Planned Features
- Team collaboration and sharing
- Real-time synchronization across devices
- File attachments and comments
- Time tracking and reporting
- Integration with calendar apps
- Offline functionality

## Technology Stack
Built with Flutter for cross-platform compatibility, using SQLite for local storage and Firebase for cloud synchronization. The app follows MVVM architecture pattern for maintainable and testable code.

## Development Status
Currently in active development phase. Core functionality is complete, working on team collaboration features and cloud synchronization.
        ''',
        githubUrl: 'https://github.com/example/task-manager',
        liveUrl: null,
        technologies: ['Flutter', 'Dart', 'SQLite', 'Firebase', 'Provider', 'HTTP'],
        status: 'Draft',
        category: 'Mobile Development',
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(days: 1)),
        imageUrls: ['assets/images/task-manager-1.png'],
      ),
      AdminProjectModel(
        id: '4',
        title: 'Weather Dashboard',
        description: 'Real-time weather tracking application with detailed forecasts and analytics',
        content: '''
# Weather Dashboard

A modern weather application that provides real-time weather data, forecasts, and weather analytics for multiple locations.

## Features
- Current weather conditions for any location
- 7-day weather forecast with hourly details
- Interactive weather maps
- Weather alerts and notifications
- Historical weather data analysis
- Customizable dashboard with widgets
- Favorite locations management

## API Integration
The app integrates with multiple weather APIs including OpenWeatherMap and WeatherAPI to provide accurate and comprehensive weather data. Data is cached locally for offline access.

## Design Philosophy
The UI follows material design principles with a focus on data visualization and user experience. Weather information is presented in an intuitive and visually appealing manner using charts and interactive elements.

## Future Enhancements
- AI-powered weather predictions
- Integration with IoT weather stations
- Social features for sharing weather updates
- Advanced analytics and reporting
        ''',
        githubUrl: 'https://github.com/example/weather-dashboard',
        liveUrl: 'https://weather.example.com',
        technologies: ['Flutter', 'Web', 'REST API', 'Charts', 'Geolocation', 'Provider'],
        status: 'Published',
        category: 'Web Development',
        createdAt: now.subtract(const Duration(days: 45)),
        updatedAt: now.subtract(const Duration(days: 7)),
        imageUrls: ['assets/images/weather-1.png', 'assets/images/weather-2.png', 'assets/images/weather-3.png'],
      ),
    ]);
    notifyListeners();
  }

  Future<void> loadProjects() async {
    _setLoading(true);
    try {
      // TODO: Implement actual API call to load projects
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      _error = null;
    } catch (e) {
      _error = 'Failed to load projects: ${e.toString()}';
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> createProject(Map<String, dynamic> projectData) async {
    _setLoading(true);
    try {
      final now = DateTime.now();
      final project = AdminProjectModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: projectData['title'] as String,
        description: projectData['description'] as String,
        content: projectData['content'] as String,
        githubUrl: projectData['githubUrl'] as String?,
        liveUrl: projectData['liveUrl'] as String?,
        technologies: List<String>.from(projectData['technologies'] as List? ?? []),
        status: projectData['status'] as String? ?? 'Draft',
        category: projectData['category'] as String? ?? 'Other',
        createdAt: now,
        updatedAt: now,
        imageUrls: List<String>.from(projectData['imageUrls'] as List? ?? []),
      );

      _projects.add(project);
      notifyListeners();

      // TODO: Implement actual API call to save project
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      return true;
    } catch (e) {
      _error = 'Failed to create project: ${e.toString()}';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> updateProject(String projectId, Map<String, dynamic> projectData) async {
    _setLoading(true);
    try {
      final index = _projects.indexWhere((p) => p.id == projectId);
      if (index == -1) {
        _error = 'Project not found';
        return false;
      }

      final existingProject = _projects[index];
      final updatedProject = existingProject.copyWith(
        title: projectData['title'] as String?,
        description: projectData['description'] as String?,
        content: projectData['content'] as String?,
        githubUrl: projectData['githubUrl'] as String?,
        liveUrl: projectData['liveUrl'] as String?,
        technologies: projectData['technologies'] != null ? List<String>.from(projectData['technologies'] as List) : null,
        status: projectData['status'] as String?,
        category: projectData['category'] as String?,
        updatedAt: DateTime.now(),
        imageUrls: projectData['imageUrls'] != null ? List<String>.from(projectData['imageUrls'] as List) : null,
      );

      _projects[index] = updatedProject;
      notifyListeners();

      // TODO: Implement actual API call to update project
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      return true;
    } catch (e) {
      _error = 'Failed to update project: ${e.toString()}';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> deleteProject(String projectId) async {
    _setLoading(true);
    try {
      final index = _projects.indexWhere((p) => p.id == projectId);
      if (index == -1) {
        _error = 'Project not found';
        return false;
      }

      _projects.removeAt(index);
      notifyListeners();

      // TODO: Implement actual API call to delete project
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      return true;
    } catch (e) {
      _error = 'Failed to delete project: ${e.toString()}';
      return false;
    } finally {
      _setLoading(false);
    }
  }

  AdminProjectModel? getProject(String projectId) {
    try {
      return _projects.firstWhere((p) => p.id == projectId);
    } catch (e) {
      return null;
    }
  }

  List<AdminProjectModel> getProjectsByCategory(String category) {
    return _projects.where((p) => p.category == category).toList();
  }

  List<AdminProjectModel> searchProjects(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _projects.where((p) => p.title.toLowerCase().contains(lowercaseQuery) || p.description.toLowerCase().contains(lowercaseQuery) || p.technologies.any((tech) => tech.toLowerCase().contains(lowercaseQuery))).toList();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
