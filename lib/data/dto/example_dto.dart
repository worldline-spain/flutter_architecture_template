import 'package:worldline_flutter/domain/models/example/example.dart';

class ExampleDto {
  final List<ExampleElementDto> list;

  ExampleDto({required this.list});

  factory ExampleDto.fromJson(Map<String, dynamic> json) => ExampleDto(
        list: List<ExampleElementDto>.from(
          json["list"].map(
            (x) => ExampleElementDto.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(
          list.map(
            (x) => x.toJson(),
          ),
        ),
      };

  List<Example> toModel() {
    return list.isEmpty ? [] : list.map((e) => e.toModel()).toList();
  }
}

class ExampleElementDto {
  final String id;
  final String title;
  final String geocoordinates;
  final String image;

  ExampleElementDto({
    required this.id,
    required this.title,
    required this.geocoordinates,
    required this.image,
  });

  factory ExampleElementDto.fromJson(Map<String, dynamic> json) =>
      ExampleElementDto(
        id: json["id"],
        title: json["title"],
        geocoordinates: json["geocoordinates"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "geocoordinates": geocoordinates,
        "image": image,
      };

  Example toModel() {
    return Example(
      id: id,
      title: title,
      geocoordinates: geocoordinates,
      image: image,
    );
  }
}
