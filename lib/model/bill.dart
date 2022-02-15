class Bill {

  String id;
  String informationDate;
  String emailaddress;
  String repairname;
  String roomnumber;
  String dormitoryX;
  String phonenumber;
  String lineID;
  String date;
  String status;
  String time;
  String list;
  String photo;
  String details;
  String msg;

  Bill(
      {
        this.id,
        this.informationDate,
      this.emailaddress,
      this.repairname,
      this.roomnumber,
      this.dormitoryX,
      this.phonenumber,
      this.lineID,
      this.date,
      this.status,
      this.time,
      this.list,
      this.photo,
      this.details,
      this.msg});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    informationDate = json['informationDate'].toString();
    emailaddress = json['emailaddress'].toString();
    repairname = json['repairname'].toString();
    roomnumber = json['roomnumber'].toString();
    dormitoryX = json['dormitoryX'].toString();
    phonenumber = json['phonenumber'].toString();
    lineID = json['lineID'].toString();
    date = json['Date'].toString();
    status = json['status'].toString();
    time = json['time'].toString();
    list = json['list'].toString();
    photo = json['photo'].toString();
    details = json['details'].toString();
    msg = json['msg'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['informationDate'] = this.informationDate;
    data['emailaddress'] = this.emailaddress;
    data['repairname'] = this.repairname;
    data['roomnumber'] = this.roomnumber.toString();
    data['dormitoryX'] = this.dormitoryX;
    data['phonenumber'] = this.phonenumber;
    data['lineID'] = this.lineID;
    data['Date'] = this.date;
    data['status'] = this.status;
    data['time'] = this.time;
    data['list'] = this.list;
    data['photo'] = this.photo;
    data['details'] = this.details;
    data['msg'] = this.msg;
    return data;
  }

  @override
  String toString() {
    return this.informationDate;
  }
}
