class Item {
  Item({
    this.title,
    this.room,
    this.price,
    this.top,
    this.category,
    this.imgUrl,
    this.about,
    this.tips,
    this.activity,
  });

  String? title;
  String? room;
  int? price;
  bool? top;
  String? category;
  String? imgUrl;
  String? about;
  String? tips;
  String? activity;

  factory Item.fromJson(Map<String?, dynamic> json) => Item(
        title: json["title"],
        room: json["room"],
        price: json["price"],
        top: json["top"],
        category: json["category"],
        imgUrl: json["imgUrl"],
        about: json["about"],
        tips: json["tips"],
        activity: json["activity"],
      );

  Map<String?, dynamic> toJson() => {
        "title": title,
        "room": room,
        "price": price,
        "top": top,
        "category": category,
        "imgUrl": imgUrl,
        "about": about,
        "tips": tips,
        "activity": activity,
      };

  static List<Item> generatedItems() {
    List<Map<String, dynamic>> itemList = [
      {
        "title": "Fiddle Leaf",
        "room": "Living Room",
        "price": 35,
        "top": false,
        "category": "indoor",
        "imgUrl": "assets/images/plant.png",
        "about": "about",
        "tips": "tips",
        "activity": "activity"
      },
      {
        "title": "Aloe Vera",
        "room": "Living Room",
        "price": 35,
        "top": false,
        "category": "outdoor",
        "imgUrl": "assets/images/plant.png",
        "about": "about",
        "tips": "tips",
        "activity": "activity"
      },
      {
        "title": "Ficcus",
        "room": "Bathroom",
        "price": 18,
        "top": false,
        "category": "indoor",
        "imgUrl": "assets/images/plant.png",
        "about": "about",
        "tips": "tips",
        "activity": "activity"
      },
      {
        "title": "Geranimum",
        "room": "Bedroom",
        "price": 12,
        "top": true,
        "category": "indoor",
        "imgUrl": "assets/images/plant.png",
        "about": "about",
        "tips": "tips",
        "activity": "activity"
      },
      {
        "title": "Kentia Marius",
        "room": "Living room",
        "price": 12,
        "top": true,
        "category": "indoor",
        "imgUrl": "assets/images/plant.png",
        "about": "about",
        "tips": "tips",
        "activity": "activity"
      },
    ];
    return itemList.map((e) => Item.fromJson(e)).toList();
  }
}
