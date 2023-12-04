// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    String? thumbnail;
    int? id;
    String? title;
    DateTime? dateAndTime;
    String? slug;
    DateTime? createdAt;
    String? manifest;
    int? liveStatus;
    dynamic liveManifest;
    bool? isLive;
    String? channelImage;
    String? channelName;
    String? channelUsername;
    bool? isVerified;
    String? channelSlug;
    String? channelSubscriber;
    int? channelId;
    String? type;
    String? viewers;
    String? duration;

    VideoModel({
        this.thumbnail,
        this.id,
        this.title,
        this.dateAndTime,
        this.slug,
        this.createdAt,
        this.manifest,
        this.liveStatus,
        this.liveManifest,
        this.isLive,
        this.channelImage,
        this.channelName,
        this.channelUsername,
        this.isVerified,
        this.channelSlug,
        this.channelSubscriber,
        this.channelId,
        this.type,
        this.viewers,
        this.duration,
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        thumbnail: json["thumbnail"],
        id: json["id"],
        title: json["title"],
        dateAndTime: json["date_and_time"] == null ? null : DateTime.parse(json["date_and_time"]),
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        manifest: json["manifest"],
        liveStatus: json["live_status"],
        liveManifest: json["live_manifest"],
        isLive: json["is_live"],
        channelImage: json["channel_image"],
        channelName: json["channel_name"],
        channelUsername: json["channel_username"],
        isVerified: json["is_verified"],
        channelSlug: json["channel_slug"],
        channelSubscriber: json["channel_subscriber"],
        channelId: json["channel_id"],
        type: json["type"],
        viewers: json["viewers"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "id": id,
        "title": title,
        "date_and_time": dateAndTime?.toIso8601String(),
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "manifest": manifest,
        "live_status": liveStatus,
        "live_manifest": liveManifest,
        "is_live": isLive,
        "channel_image": channelImage,
        "channel_name": channelName,
        "channel_username": channelUsername,
        "is_verified": isVerified,
        "channel_slug": channelSlug,
        "channel_subscriber": channelSubscriber,
        "channel_id": channelId,
        "type": type,
        "viewers": viewers,
        "duration": duration,
    };
}
