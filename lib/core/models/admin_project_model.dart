class AdminProjectModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> technologies;
  final String status; // Draft, Published
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String>? imageUrls;

  AdminProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.githubUrl,
    this.liveUrl,
    required this.technologies,
    required this.status,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrls,
  });

  factory AdminProjectModel.fromJson(Map<String, dynamic> json) {
    return AdminProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      technologies: List<String>.from(json['technologies'] as List? ?? []),
      status: json['status'] as String? ?? 'Draft',
      category: json['category'] as String? ?? 'Other',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imageUrls: json['imageUrls'] != null ? List<String>.from(json['imageUrls'] as List) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'technologies': technologies,
      'status': status,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'imageUrls': imageUrls,
    };
  }

  AdminProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? githubUrl,
    String? liveUrl,
    List<String>? technologies,
    String? status,
    String? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? imageUrls,
  }) {
    return AdminProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      technologies: technologies ?? this.technologies,
      status: status ?? this.status,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  // Convert to the original ProjectModel for frontend display
  Map<String, dynamic> toFrontendProject() {
    return {
      'id': int.tryParse(id) ?? 0,
      'title': title,
      'description': description,
      'image': imageUrls?.isNotEmpty == true ? imageUrls!.first : '',
      'github_link': githubUrl ?? '',
      'live_link': liveUrl ?? '',
      'technologies': technologies,
      'status': status,
      'category': category,
    };
  }
}
