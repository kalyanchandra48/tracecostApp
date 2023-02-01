import 'dart:convert';

import 'package:hive/hive.dart';
part 'media.g.dart';
@HiveType(typeId: 1)
class Media {
  @HiveField(1)
  String mediaId;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  String mediaTitle;
  @HiveField(4)
  String mid;
  Media({
    required this.mediaId,
    required this.createdAt,
    required this.mediaTitle,
    required this.mid,
  });

  Media copyWith({
    String? mediaId,
    String? createdAt,
    String? mediaTitle,
    String? mid,
  }) {
    return Media(
      mediaId: mediaId ?? this.mediaId,
      createdAt: createdAt ?? this.createdAt,
      mediaTitle: mediaTitle ?? this.mediaTitle,
      mid: mid ?? this.mid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'mediaId': mediaId});
    result.addAll({'createdAt': createdAt});
    result.addAll({'mediaTitle': mediaTitle});
    result.addAll({'mid': mid});

    return result;
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      mediaId: map['mediaId'] ?? '',
      createdAt: map['createdAt'] ?? '',
      mediaTitle: map['mediaTitle'] ?? '',
      mid: map['mid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Media.fromJson(String source) => Media.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Media(mediaId: $mediaId, createdAt: $createdAt, mediaTitle: $mediaTitle, mid: $mid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Media &&
        other.mediaId == mediaId &&
        other.createdAt == createdAt &&
        other.mediaTitle == mediaTitle &&
        other.mid == mid;
  }

  @override
  int get hashCode {
    return mediaId.hashCode ^
        createdAt.hashCode ^
        mediaTitle.hashCode ^
        mid.hashCode;
  }
}
