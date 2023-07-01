class AboutMeModel {
  final String title;
  final String description;
  final String image;

  const AboutMeModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory AboutMeModel.fromJson(Map<String, dynamic> json) {
    return AboutMeModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
