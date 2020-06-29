// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

import 'media_type.dart';

class PhotoModel {
  const PhotoModel({
    this.date,
    this.explanation,
    this.mediaType,
    this.serviceVersion,
    this.thumbnailUrl,
    this.title,
    this.url,
    this.hdurl,
    this.copyright,
  });

  final DateTime date;
  final String explanation;
  final MediaType mediaType;
  final String serviceVersion;
  final String thumbnailUrl;
  final String title;
  final String url;
  final String hdurl;
  final String copyright;

  String get imageUrl {
    switch (mediaType) {
      case MediaType.video:
        return thumbnailUrl;
      case MediaType.image:
        return hdurl;
      default:
        return null;
    }
  }

  PhotoModel copyWith({
    DateTime date,
    String explanation,
    MediaType mediaType,
    String serviceVersion,
    String thumbnailUrl,
    String title,
    String url,
    String hdurl,
    String copyright,
  }) =>
      PhotoModel(
        date: date ?? this.date,
        explanation: explanation ?? this.explanation,
        mediaType: mediaType ?? this.mediaType,
        serviceVersion: serviceVersion ?? this.serviceVersion,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        title: title ?? this.title,
        url: url ?? this.url,
        hdurl: hdurl ?? this.hdurl,
        copyright: copyright ?? this.copyright,
      );

  factory PhotoModel.fromRawJson(String str) =>
      PhotoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        explanation: json["explanation"] == null ? null : json["explanation"],
        mediaType: json["media_type"] == null
            ? null
            : mediaTypeValues.map[json["media_type"]],
        serviceVersion:
            json["service_version"] == null ? null : json["service_version"],
        thumbnailUrl:
            json["thumbnail_url"] == null ? null : json["thumbnail_url"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        hdurl: json["hdurl"] == null ? null : json["hdurl"],
        copyright: json["copyright"] == null ? null : json["copyright"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "explanation": explanation == null ? null : explanation,
        "media_type":
            mediaType == null ? null : mediaTypeValues.reverse[mediaType],
        "service_version": serviceVersion == null ? null : serviceVersion,
        "thumbnail_url": thumbnailUrl == null ? null : thumbnailUrl,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "hdurl": hdurl == null ? null : hdurl,
        "copyright": copyright == null ? null : copyright,
      };
}
