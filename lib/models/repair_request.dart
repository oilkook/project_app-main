import 'dart:convert';

RepairRequest repairRequestFromJson(String str) {
  final jsonData = json.decode(str);
  return RepairRequest.fromJson(jsonData);
}

String repairRequestToJson(RepairRequest data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class RepairRequest {
  String id;
  String informationDate;
  String emailaddress;
  String repairname;
  String roomnumber;
  String dormitoryX;
  String phonenumber;
  String lineId;
  String date;
  String status;
  String time;
  String list;
  String photo;
  String details;
  String msg;

  RepairRequest({
    this.id,
    this.informationDate,
    this.emailaddress,
    this.repairname,
    this.roomnumber,
    this.dormitoryX,
    this.phonenumber,
    this.lineId,
    this.date,
    this.status,
    this.time,
    this.list,
    this.photo,
    this.details,
    this.msg,
  });

  factory RepairRequest.fromJson(Map<String, dynamic> json) =>
      new RepairRequest(
        id: json["id"],
        informationDate: json["informationDate"].toString(),
        emailaddress: json["emailaddress"].toString(),
        repairname: json["repairname"].toString(),
        roomnumber: json["roomnumber"].toString(),
        dormitoryX: json["dormitoryX"].toString(),
        phonenumber: json["phonenumber"].toString(),
        lineId: json["lineID"].toString(),
        date: json["Date"].toString(),
        status: json["status"].toString(),
        time: json["time"].toString(),
        list: json["list"].toString(),
        photo: json["photo"].toString(),
        details: json["details"].toString(),
        msg: json["msg"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "informationDate": informationDate,
        "emailaddress": emailaddress,
        "repairname": repairname,
        "roomnumber": roomnumber,
        "dormitoryX": dormitoryX,
        "phonenumber": phonenumber,
        "lineID": lineId,
        "Date": date,
        "status": status,
        "time": time,
        "list": list,
        "photo": photo,
        "details": details,
        "msg": msg,
      };
}
