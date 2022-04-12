// ignore_for_file: prefer_collection_literals

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
        evDetail!.add(EvDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ev_name'] = evName;
    data['ev_description'] = evDescription;
    data['ev_img'] = evImg;
    data['ev_host'] = evHost;
    if (evDetail != null) {
      data['ev_detail'] = evDetail!.map((v) => v.toJson()).toList();
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
        eventLocation!.add(EventLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ev_type'] = evType;
    data['ev_price'] = evPrice;
    data['ev_date'] = evDate;
    if (eventLocation != null) {
      data['event_location'] = eventLocation!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ev_location_name'] = evLocationName;
    return data;
  }
}
