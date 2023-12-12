class CatsDTO {
  final List breeds;
  final String id;
  final String url;
  final int width;
  final int height;


  CatsDTO({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatsDTO.fromJson(Map<String, dynamic> json) => CatsDTO(
    breeds: json['breeds'],
    id: json['id'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}