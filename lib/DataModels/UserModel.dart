class UserModel {
  String? uId;
  String? name;
  String? phoneNumber;
  String? emailAddress;
  String? address;

  UserModel(
      {required this.uId,required this.address ,required this.name, required this.phoneNumber, required this.emailAddress,});

  UserModel.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
  }

  Map<String, dynamic> toMap(){
    return {
      'uId' : uId,
      'name' : name,
      'address' : address,
      'phoneNumber' : phoneNumber,
      'emailAddress' : emailAddress,
    };
  }
}