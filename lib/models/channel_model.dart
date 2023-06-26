// To parse this JSON data, do
//
//     final channelModel = channelModelFromJson(jsonString);

import 'dart:convert';

ChannelModel channelModelFromJson(String str) => ChannelModel.fromJson(json.decode(str));

String channelModelToJson(ChannelModel data) => json.encode(data.toJson());

class ChannelModel {
  String kind;
  String etag;
  String id;
  Snippet snippet;
  Statistics statistics;
  BrandingSettings brandingSettings;

  ChannelModel({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.statistics,
    required this.brandingSettings,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
    statistics: Statistics.fromJson(json["statistics"]),
    brandingSettings: BrandingSettings.fromJson(json["brandingSettings"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
    "statistics": statistics.toJson(),
    "brandingSettings": brandingSettings.toJson(),
  };
}

class BrandingSettings {
  Channel channel;
  ImageChannel image;

  BrandingSettings({
    required this.channel,
    required this.image,
  });

  factory BrandingSettings.fromJson(Map<String, dynamic> json) => BrandingSettings(
    channel: Channel.fromJson(json["channel"]),
    image: ImageChannel.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "channel": channel.toJson(),
    "image": image.toJson(),
  };
}

class Channel {
  String title;
  String description;
  String keywords;
  String country;

  Channel({
    required this.title,
    required this.description,
    required this.keywords,
    required this.country,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "keywords": keywords,
    "country": country,
  };
}

class ImageChannel {
  String bannerExternalUrl;

  ImageChannel({
    required this.bannerExternalUrl,
  });

  factory ImageChannel.fromJson(Map<String, dynamic> json) => ImageChannel(
    bannerExternalUrl: json["bannerExternalUrl"],
  );

  Map<String, dynamic> toJson() => {
    "bannerExternalUrl": bannerExternalUrl,
  };
}

class Snippet {
  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;

  Snippet({
    required this.title,
    required this.description,
    required this.customUrl,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    title: json["title"],
    description: json["description"],
    customUrl: json["customUrl"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    localized: Localized.fromJson(json["localized"]),
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "customUrl": customUrl,
    "publishedAt": publishedAt.toIso8601String(),
    "thumbnails": thumbnails.toJson(),
    "localized": localized.toJson(),
    "country": country,
  };
}

class Localized {
  String title;
  String description;

  Localized({
    required this.title,
    required this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
  };
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;

  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class Statistics {
  String viewCount;
  String subscriberCount;
  bool hiddenSubscriberCount;
  String videoCount;

  Statistics({
    required this.viewCount,
    required this.subscriberCount,
    required this.hiddenSubscriberCount,
    required this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    viewCount: json["viewCount"],
    subscriberCount: json["subscriberCount"],
    hiddenSubscriberCount: json["hiddenSubscriberCount"],
    videoCount: json["videoCount"],
  );

  Map<String, dynamic> toJson() => {
    "viewCount": viewCount,
    "subscriberCount": subscriberCount,
    "hiddenSubscriberCount": hiddenSubscriberCount,
    "videoCount": videoCount,
  };
}
