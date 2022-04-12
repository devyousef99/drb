// ignore_for_file: prefer_collection_literals

class Address {
  int? id;
  String? usrDist;
  String? usrCity;
  String? usrBuilding;

  Address(
      {required this.id,
      required this.usrDist,
      required this.usrCity,
      required this.usrBuilding});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usrDist = json['usr_dist'];
    usrCity = json['usr_city'];
    usrBuilding = json['usr_building'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['usr_dist'] = usrDist;
    data['usr_city'] = usrCity;
    data['usr_building'] = usrBuilding;
    return data;
  }
}
