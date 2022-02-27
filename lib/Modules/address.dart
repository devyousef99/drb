class Address {
  int id;
  String usrDist;
  String usrCity;
  String usrBuilding;

  Address({this.id, this.usrDist, this.usrCity, this.usrBuilding});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usrDist = json['usr_dist'];
    usrCity = json['usr_city'];
    usrBuilding = json['usr_building'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['usr_dist'] = this.usrDist;
    data['usr_city'] = this.usrCity;
    data['usr_building'] = this.usrBuilding;
    return data;
  }
}
