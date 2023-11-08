
class Services {
  Services({
    required this.result,
    required this.data,
  });

  bool result;
  Data data;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    result: json["result"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.services,
  });

  List<Service> services;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    required this.id,
    required this.price,
    required this.title,
    required this.icon,
  });

  int id;
  int price;
  String title;
  String icon;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    price: json["price"],
    title: json["title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "title": title,
    "icon": icon,
  };
}
