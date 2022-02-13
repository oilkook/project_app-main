class Bill {
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
      {this.informationDate,
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
    informationDate = json['informationDate'];
    emailaddress = json['emailaddress'];
    repairname = json['repairname'];
    roomnumber = json['roomnumber'].toString();
    dormitoryX = json['dormitoryX'];
    phonenumber = json['phonenumber'];
    lineID = json['lineID'];
    date = json['Date'];
    status = json['status'];
    time = json['time'];
    list = json['list'];
    photo = json['photo'];
    details = json['details'];
    msg = json['msg'];
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
