class AddCartResponse {
  String? message;
  bool? error;
  bool? missmatch;

  AddCartResponse({this.message, this.error, this.missmatch});

  AddCartResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    missmatch = json['missmatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    data['missmatch'] = this.missmatch;
    return data;
  }
}
