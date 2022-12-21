class SetDonorDataModels {
  String? donorName;
  String? donorEmail;
  String? donorPhone;
  String? donorGender;
  String? donorBloodGroup;
  String? donorDateOfBirth;
  String? donorAddress;
  String? donorImagesUrl;

  SetDonorDataModels(
      this.donorName,
      this.donorEmail,
      this.donorPhone,
      this.donorGender,
      this.donorBloodGroup,
      this.donorDateOfBirth,
      this.donorAddress,
      this.donorImagesUrl);

  SetDonorDataModels.fromJson(dynamic json) {
    donorName = json["donorName"];
    donorEmail = json["donorEmail"];
    donorPhone = json["donorPhone"];
    donorGender = json["donorGender"];
    donorBloodGroup = json["donorBloodGroup"];
    donorDateOfBirth = json["donorDateOfBirth"];
    donorAddress = json["donorAddress"];
    donorImagesUrl = json["donorImagesUrl"];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['donorName'] = donorName;
    map['donorEmail'] = donorEmail;
    map['donorPhone'] = donorPhone;
    map['donorGender'] = donorGender;
    map['donorBloodGroup'] = donorBloodGroup;
    map['donorDateOfBirth'] = donorDateOfBirth;
    map['donorAddress'] = donorAddress;
    map['donorImagesUrl'] = donorImagesUrl;

    return map;
  }
}

class DonorPostModels {
  String? donorEmail;
  String? donorImage1;
  String? donorImage2;
  String? donorPost;
  String? postDate;

  DonorPostModels(this.donorEmail, this.donorImage1, this.donorImage2,
      this.donorPost, this.postDate);

  DonorPostModels.fromJson(dynamic json) {
    donorEmail = json['donorEmail'];
    donorImage1 = json['donorImage1'];
    donorImage2 = json['donorImage2'];
    donorPost = json['donorPost'];
    postDate = json['postDate'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['donorEmail'] = donorEmail;
    map['donorImage1'] = donorImage1;
    map['donorImage2'] = donorImage2;
    map['donorPost'] = donorPost;
    map['postDate'] = postDate;
    return map;
  }
}

