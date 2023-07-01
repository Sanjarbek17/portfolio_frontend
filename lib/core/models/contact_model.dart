class ContactModel {
  final String name;
  final String link;
  final String icon;

  const ContactModel({
    required this.name,
    required this.link,
    required this.icon,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'] as String,
      link: json['link'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'link': link,
      'icon': icon,
    };
  }
}
