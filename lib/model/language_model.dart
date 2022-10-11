class LanguageModel {
  String? status;
  String? message;
  List<LanguageList>? languageList;

  LanguageModel({this.status, this.message, this.languageList});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['language_list'] != null) {
      languageList = <LanguageList>[];
      json['language_list'].forEach((v) {
        languageList!.add(LanguageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.languageList != null) {
      data['language_list'] =
          this.languageList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageList {
  String? id;
  String? country_name_id;
  String? languageKey;
  String? language;
  String? status;
  String? createdAt;

  LanguageList(
      {this.id,
      this.languageKey,
      this.language,
      this.status,
      this.createdAt,
      this.country_name_id});

  LanguageList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country_name_id = json['country_name_id'];
    languageKey = json['language_key'];
    language = json['language'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_name_id'] = this.country_name_id;
    data['language_key'] = this.languageKey;
    data['language'] = this.language;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
