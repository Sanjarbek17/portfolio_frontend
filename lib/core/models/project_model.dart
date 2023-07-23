class ProjectModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String github;
  final String live;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.github,
    required this.live,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      github: json['github_link'] as String,
      live: json['live_link'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'github': github,
      'live': live,
    };
  }
}
