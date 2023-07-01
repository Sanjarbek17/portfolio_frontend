class Skill {
  final String title;
  final String description;
  final String icon;

  const Skill({
    required this.title,
    required this.description,
    required this.icon,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
    };
  }
}
