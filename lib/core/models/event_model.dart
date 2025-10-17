class EventModel {
  String id;
  String CategoryId;
  String userid;
  String title;
  String desc;
  String date;
  String time;
  String? location;
  String imageUrl;
  bool isFav;

  EventModel({
    required this.id,
    required this.CategoryId,
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
    this.location,
    required this.imageUrl,
    this.isFav = false,
    required this.userid,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      CategoryId: json['CategoryId'],
      userid: json['userid'],
      title: json['title'],
      desc: json['desc'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      isFav: json['isFav'] ?? false,
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'CategoryId': CategoryId,
      'userid': userid,
      'title': title,
      'desc': desc,
      'date': date,
      'time': time,
      'location': location,
      'imageUrl': imageUrl,
      'isFav': isFav,
    };
  }
}
