class UserModel {
  String? uId;
  String? name;
  String? phoneNumber;
  String? emailAddress;

  UserModel(
      {required this.uId, required this.name, required this.phoneNumber, required this.emailAddress,});

  UserModel.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
  }

  Map<String, dynamic> toMap(){
    return {
      'uId' : uId,
      'name' : name,
      'phoneNumber' : phoneNumber,
      'emailAddress' : emailAddress,
    };
  }
}