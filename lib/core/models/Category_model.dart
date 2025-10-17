class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  String icon;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.icon = 'assets/icons/all_icon.png',
  });
  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'gaming',
      name: 'Gameing',
      icon: 'assets/icons/game_icon.png',
      imageUrl: 'assets/images/gameing.png',
    ),
    CategoryModel(
      id: 'eating',
      icon: 'assets/icons/eating_icon.png',
      name: 'Eating',
      imageUrl: 'assets/images/eating.png',
    ),
    CategoryModel(
      id: 'book_club',
      icon: 'assets/icons/bookclub_icon.png',
      name: 'Book Club',
      imageUrl: 'assets/images/book_club.png',
    ),
    CategoryModel(
      icon: 'assets/icons/birthday_icon.png',
      id: 'birthday',
      name: 'Birthday',
      imageUrl: 'assets/images/birthday.png',
    ),
    CategoryModel(
      id: 'exhibition',
      name: 'Exhibition',
      icon: 'assets/icons/exhibition_icon.png',
      imageUrl: 'assets/images/exhibition.png',
    ),
    CategoryModel(
      id: 'holiday',
      name: 'Holiday',
      icon: 'assets/icons/holiday_icon.png',
      imageUrl: 'assets/images/holiday.png',
    ),
    CategoryModel(
      id: 'meeting',
      name: 'Meeting',
      icon: 'assets/icons/meeting_icon.png',
      imageUrl: 'assets/images/meeting.png',
    ),
    CategoryModel(
      id: 'sport',
      name: 'Sport',
      icon: 'assets/icons/sport_icon.png',
      imageUrl: 'assets/images/sport.png',
    ),
    CategoryModel(
      id: 'workshop',
      name: 'Workshop',
      icon: 'assets/icons/workshop_icon.png',
      imageUrl: 'assets/images/workshop.png',
    ),
  ];
  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(id: 'all', name: 'All', imageUrl: ''),
    CategoryModel(
      id: 'gaming',
      name: 'Gameing',
      icon: 'assets/icons/game_icon.png',
      imageUrl: 'assets/images/gameing.png',
    ),
    CategoryModel(
      id: 'eating',
      icon: 'assets/icons/eating_icon.png',
      name: 'Eating',
      imageUrl: 'assets/images/eating.png',
    ),
    CategoryModel(
      id: 'book_club',
      icon: 'assets/icons/bookclub_icon.png',
      name: 'Book Club',
      imageUrl: 'assets/images/book_club.png',
    ),
    CategoryModel(
      icon: 'assets/icons/birthday_icon.png',
      id: 'birthday',
      name: 'Birthday',
      imageUrl: 'assets/images/birthday.png',
    ),
    CategoryModel(
      id: 'exhibition',
      name: 'Exhibition',
      icon: 'assets/icons/exhibition_icon.png',
      imageUrl: 'assets/images/exhibition.png',
    ),
    CategoryModel(
      id: 'holiday',
      name: 'Holiday',
      icon: 'assets/icons/holiday_icon.png',
      imageUrl: 'assets/images/holiday.png',
    ),
    CategoryModel(
      id: 'meeting',
      name: 'Meeting',
      icon: 'assets/icons/meeting_icon.png',
      imageUrl: 'assets/images/meeting.png',
    ),
    CategoryModel(
      id: 'sport',
      name: 'Sport',
      icon: 'assets/icons/sport_icon.png',
      imageUrl: 'assets/images/sport.png',
    ),
    CategoryModel(
      id: 'workshop',
      name: 'Workshop',
      icon: 'assets/icons/workshop_icon.png',
      imageUrl: 'assets/images/workshop.png',
    ),
  ];

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'imageUrl': imageUrl};
  }
}
