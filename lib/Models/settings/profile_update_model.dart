class ProfileUpdateModel {
  String customerId;
  String emailId;
  String mobileNumber;
  String address;
  String country;
  String city;
  String state;
  String pincode;
  String name;
  String image;

  ProfileUpdateModel({
    required this.address,
    required this.country,
    required this.customerId,
    required this.emailId,
    required this.mobileNumber,
    required this.name,
    required this.pincode,
    required this.city,
    required this.image,
    required this.state}); 
}