class Category {
  String code;
  String message;
  List<Data> data;

  Category({this.code, this.message, this.data});

  Category.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int typeId;
  String typeName;
  String typeImg;
  List<BxMallSubDto> bxMallSubDto;

  Data({this.id, this.typeId, this.typeName, this.typeImg, this.bxMallSubDto});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    typeName = json['type_name'];
    typeImg = json['type_img'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<BxMallSubDto>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    data['type_img'] = this.typeImg;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BxMallSubDto {
  int id;
  Null mallSubId;
  int mallCategoryId;
  String mallSubName;
  Null comments;

  BxMallSubDto(
      {this.id,
      this.mallSubId,
      this.mallCategoryId,
      this.mallSubName,
      this.comments});

  BxMallSubDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}

