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
  Map<String, dynamic> toJson(){
    final map= <String,dynamic>{};
    map['donorName']= donorName;
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
