import 'dart:convert';

OwnScreens ownScreensFromJson(String str) {
  final jsonData = json.decode(str);
  return OwnScreens.fromJson(jsonData);
}

String ownScreensToJson(OwnScreens data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class OwnScreens {
  int cardId;
  String ownerName;
  String cardNumber;
  String cardCvc;
  String cardExpireMm;
  String cardExpireYy;
  bool isDefault;

  OwnScreens({
    this.cardId,
    this.ownerName,
    this.cardNumber,
    this.cardCvc,
    this.cardExpireMm,
    this.cardExpireYy,
    this.isDefault,
  });

  factory OwnScreens.fromJson(Map<String, dynamic> json) => new OwnScreens(
        cardId: json["card_id"],
        ownerName: json["owner_name"],
        cardNumber: json["card_number"],
        cardCvc: json["card_cvc"],
        cardExpireMm: json["card_expire_mm"],
        cardExpireYy: json["card_expire_yy"],
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson({int id}) => {
        "card_id": id,
        "owner_name": ownerName,
        "card_number": cardNumber,
        "card_cvc": cardCvc,
        "card_expire_mm": cardExpireMm,
        "card_expire_yy": cardExpireYy,
        "isDefault": isDefault,
      };
}
