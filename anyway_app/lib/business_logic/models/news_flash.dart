class NewsFlashModel {
  NewsFlashModel({
    this.id,
    this.accident,
    this.author,
    this.date,
    this.description,
    this.lat,
    this.link,
    this.lon,
    this.road1,
    this.road2,
    this.resolution,
    this.title,
    this.source,
    this.organization,
    this.location,
    this.tweetId,
    this.regionHebrew,
    this.districtHebrew,
    this.yishuvName,
    this.street1Hebrew,
    this.street2Hebrew,
    this.nonUrbanIntersectionHebrew,
    this.roadSegmentName,
    this.displaySource,
  });

  factory NewsFlashModel.fromJson(Map<String, Object> json) => NewsFlashModel(
        id: json['id'] as int,
        accident: json['accident'] as bool,
        author: json['author'] as String,
        date: json['date'] as String,
        description: json['description'] as String,
        lat: json['lat'] as double,
        lon: json['lon'] as double,
        link: json['link'] as String,
        road1: json['road1'] as double,
        road2: json['road2'] as double,
        resolution: json['resolution'] as String,
        title: json['title'] as String,
        source: json['source'] as String,
        organization: json['organization'] as String,
        location: json['location'] as String,
        tweetId: json['tweet_id'] as int,
        regionHebrew: json['region_hebrew'] as String,
        districtHebrew: json['district_hebrew'] as String,
        yishuvName: json['yishuv_name'] as String,
        street1Hebrew: json['street1_hebrew'] as String,
        street2Hebrew: json['street2_hebrew'] as String,
        nonUrbanIntersectionHebrew:
            json['non_urban_intersection_hebrew'] as String,
        roadSegmentName: json['road_segment_name'] as String,
        displaySource: json['display_source'] as String,
      );

  final int id;
  final bool accident;
  final String author;
  final String date;
  final String description;
  final double lat;
  final String link;
  final double lon;
  final double road1;
  final double road2;
  final String resolution;
  final String title;
  final String source;
  final String organization;
  final String location;
  final int tweetId;
  final String regionHebrew;
  final String districtHebrew;
  final String yishuvName;
  final String street1Hebrew;
  final String street2Hebrew;
  final String nonUrbanIntersectionHebrew;
  final String roadSegmentName;
  final String displaySource;

  Map<String, dynamic> toJson() => {
        'id': id,
        'accident': accident,
        'author': author,
        'date': date,
        'description': description,
        'lat': lat,
        'link': link,
        'lon': lon,
        'road1': road1,
        'road2': road2,
        'resolution': resolution,
        'title': title,
        'source': source,
        'organization': organization,
        'location': location,
        'tweet_id': tweetId,
        'region_hebrew': regionHebrew,
        'district_hebrew': districtHebrew,
        'yishuv_name': yishuvName,
        'street1_hebrew': street1Hebrew,
        'street2_hebrew': street2Hebrew,
        'non_urban_intersection_hebrew': nonUrbanIntersectionHebrew,
        'road_segment_name': roadSegmentName,
        'display_source': displaySource,
      };
}
