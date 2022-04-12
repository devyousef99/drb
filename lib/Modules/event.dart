import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  String? evName;
  String? evDescription;
  String? evImg;
  String? evHost;
  List<EvDetail>? evDetail;

  Event(
      {this.evName,
      this.evDescription,
      this.evImg,
      this.evHost,
      this.evDetail});

  Event.fromJson(Map<String, dynamic> json) {
    evName = json['ev_name'];
    evDescription = json['ev_description'];
    evImg = json['ev_img'];
    evHost = json['ev_host'];
    if (json['ev_detail'] != null) {
      evDetail = <EvDetail>[];
      json['ev_detail'].forEach((v) {
        evDetail!.add(new EvDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ev_name'] = this.evName;
    data['ev_description'] = this.evDescription;
    data['ev_img'] = this.evImg;
    data['ev_host'] = this.evHost;
    if (this.evDetail != null) {
      data['ev_detail'] = this.evDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EvDetail {
  String? evType;
  int? evPrice;
  String? evDate;
  List<EventLocation>? eventLocation;

  EvDetail({this.evType, this.evPrice, this.evDate, this.eventLocation});

  EvDetail.fromJson(Map<String, dynamic> json) {
    evType = json['ev_type'];
    evPrice = json['ev_price'];
    evDate = json['ev_date'];
    if (json['event_location'] != null) {
      eventLocation = <EventLocation>[];
      json['event_location'].forEach((v) {
        eventLocation!.add(new EventLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ev_type'] = this.evType;
    data['ev_price'] = this.evPrice;
    data['ev_date'] = this.evDate;
    if (this.eventLocation != null) {
      data['event_location'] =
          this.eventLocation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventLocation {
  String? evLocationName;

  EventLocation({this.evLocationName});

  EventLocation.fromJson(Map<String, dynamic> json) {
    evLocationName = json['ev_location_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ev_location_name'] = this.evLocationName;
    return data;
  }
}
