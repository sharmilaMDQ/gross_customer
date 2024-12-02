// To parse this JSON data, do
//
//     final offeresSliderModel = offeresSliderModelFromJson(jsonString);

import 'dart:convert';

OfferesSliderModel offeresSliderModelFromJson(String str) => OfferesSliderModel.fromJson(json.decode(str));

String offeresSliderModelToJson(OfferesSliderModel data) => json.encode(data.toJson());

class OfferesSliderModel {
    String message;
    bool error;
    OffersData data;

    OfferesSliderModel({
        required this.message,
        required this.error,
        required this.data,
    });

    factory OfferesSliderModel.fromJson(Map<String, dynamic> json) => OfferesSliderModel(
        message: json["message"],
        error: json["error"],
        data: OffersData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "data": data.toJson(),
    };
}

class OffersData {
    List<Gold> gold1;
    List<Gold> gold2;
    List<dynamic> silver1;
    List<dynamic> silver2;
    List<dynamic> bronze1;
    List<dynamic> bronze2;

    OffersData({
        required this.gold1,
        required this.gold2,
        required this.silver1,
        required this.silver2,
        required this.bronze1,
        required this.bronze2,
    });

    factory OffersData.fromJson(Map<String, dynamic> json) => OffersData(
        gold1: List<Gold>.from(json["gold-1"].map((x) => Gold.fromJson(x))),
        gold2: List<Gold>.from(json["gold-2"].map((x) => Gold.fromJson(x))),
        silver1: List<dynamic>.from(json["silver-1"].map((x) => x)),
        silver2: List<dynamic>.from(json["silver-2"].map((x) => x)),
        bronze1: List<dynamic>.from(json["bronze-1"].map((x) => x)),
        bronze2: List<dynamic>.from(json["bronze-2"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "gold-1": List<dynamic>.from(gold1.map((x) => x.toJson())),
        "gold-2": List<dynamic>.from(gold2.map((x) => x.toJson())),
        "silver-1": List<dynamic>.from(silver1.map((x) => x)),
        "silver-2": List<dynamic>.from(silver2.map((x) => x)),
        "bronze-1": List<dynamic>.from(bronze1.map((x) => x)),
        "bronze-2": List<dynamic>.from(bronze2.map((x) => x)),
    };
}

class Gold {
    int carouselAdId;
    int sellerId;
    ActionType actionType;
    int contentId;
    String adImage;
    SubscriptionType subscriptionType;

    Gold({
        required this.carouselAdId,
        required this.sellerId,
        required this.actionType,
        required this.contentId,
        required this.adImage,
        required this.subscriptionType,
    });

    factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        carouselAdId: json["carouselAdId"],
        sellerId: json["sellerId"],
        actionType: actionTypeValues.map[json["actionType"]]!,
        contentId: json["contentId"],
        adImage: json["adImage"],
        subscriptionType: subscriptionTypeValues.map[json["subscriptionType"]]!,
    );

    Map<String, dynamic> toJson() => {
        "carouselAdId": carouselAdId,
        "sellerId": sellerId,
        "actionType": actionTypeValues.reverse[actionType],
        "contentId": contentId,
        "adImage": adImage,
        "subscriptionType": subscriptionTypeValues.reverse[subscriptionType],
    };
}

enum ActionType {
    PRODUCT,
    SUBCATEGORY
}

final actionTypeValues = EnumValues({
    "product": ActionType.PRODUCT,
    "subcategory": ActionType.SUBCATEGORY
});

enum SubscriptionType {
    GOLD
}

final subscriptionTypeValues = EnumValues({
    "gold": SubscriptionType.GOLD
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
