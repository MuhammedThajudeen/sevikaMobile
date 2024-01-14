class domaindata {
  int? statusCode;
  CompanyObj? companyObj;

  domaindata({this.statusCode, this.companyObj});

  domaindata.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    companyObj = json['CompanyObj'] != null
        ? new CompanyObj.fromJson(json['CompanyObj'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = statusCode;
    if (companyObj != null) {
      data['CompanyObj'] = companyObj!.toJson();
    }
    return data;
  }
}

class CompanyObj {
  String? name;
  String? email;
  String? mobile;
  List<String>? domainName;
  int? activeFlag;
  String? bgColor;
  String? image;
  List<String>? images;
  String? address;
  String? url;

  CompanyObj(
      {this.name,
      this.email,
      this.mobile,
      this.domainName,
      this.activeFlag,
      this.bgColor,
      this.image,
      this.images,
      this.address,
      this.url});

  CompanyObj.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    mobile = json['mobile'];
    domainName = json['domainName'].cast<String>();
    activeFlag = json['activeFlag'];
    bgColor = json['bgColor'];
    image = json['image'];
    images = json['images'].cast<String>();
    address = json['address'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = name;
    data['Email'] = email;
    data['mobile'] = mobile;
    data['domainName'] = domainName;
    data['activeFlag'] = activeFlag;
    data['bgColor'] = bgColor;
    data['image'] = image;
    data['images'] = images;
    data['address'] = address;
    data['url'] = url;
    return data;
  }
}
