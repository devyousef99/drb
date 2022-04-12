class Drb {
  String? drbName;
  String? drbDescription;
  String? drbImg;
  String? drbHost;
  List<DrbDetail>? drbDetail;

  Drb(
      {this.drbName,
      this.drbDescription,
      this.drbImg,
      this.drbHost,
      this.drbDetail});

  Drb.fromJson(Map<String, dynamic> json) {
    drbName = json['drb_name'];
    drbDescription = json['drb_description'];
    drbImg = json['drb_img'];
    drbHost = json['drb_host'];
    if (json['drb_detail'] != null) {
      drbDetail = <DrbDetail>[];
      json['drb_detail'].forEach((v) {
        drbDetail!.add(new DrbDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drb_name'] = this.drbName;
    data['drb_description'] = this.drbDescription;
    data['drb_img'] = this.drbImg;
    data['drb_host'] = this.drbHost;
    if (this.drbDetail != null) {
      data['drb_detail'] = this.drbDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrbDetail {
  String? drbType;
  int? drbPrice;
  String? drbDate;
  List<DrbLocation>? drbLocation;

  DrbDetail({this.drbType, this.drbPrice, this.drbDate, this.drbLocation});

  DrbDetail.fromJson(Map<String, dynamic> json) {
    drbType = json['drb_type'];
    drbPrice = json['drb_price'];
    drbDate = json['drb_date'];
    if (json['drb_location'] != null) {
      drbLocation = <DrbLocation>[];
      json['drb_location'].forEach((v) {
        drbLocation!.add(new DrbLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drb_type'] = this.drbType;
    data['drb_price'] = this.drbPrice;
    data['drb_date'] = this.drbDate;
    if (this.drbLocation != null) {
      data['drb_location'] = this.drbLocation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrbLocation {
  String? drbLocationName;

  DrbLocation({this.drbLocationName});

  DrbLocation.fromJson(Map<String, dynamic> json) {
    drbLocationName = json['drb_location_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drb_location_name'] = this.drbLocationName;
    return data;
  }
}
