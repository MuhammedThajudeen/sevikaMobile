class Services_model {
    Services_model({
        required this.statusCode,
        required this.message,
        required this.services,
    });

    final int? statusCode;
    final String? message;
    final List<Service> services;

    factory Services_model.fromJson(Map<String, dynamic> json){ 
        return Services_model(
            statusCode: json["statusCode"],
            message: json["message"],
            services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
        );
    }

}

class Service {
    Service({
        required this.id,
        required this.activeFlag,
        required this.price,
        required this.servicePrice,
        required this.totalPrice,
        required this.documents,
        required this.categoryName,
        required this.categoryId,
        required this.name,
        required this.basicFormDetails,
        required this.formDetailes,
        required this.categoryImage,
    });

    final String? id;
    final int? activeFlag;
    final String? price;
    final String? servicePrice;
    final int? totalPrice;
    final List<String> documents;
    final String? categoryName;
    final String? categoryId;
    final String? name;
    final List<String> basicFormDetails;
    final List<FormDetaile> formDetailes;
    final String? categoryImage;

    factory Service.fromJson(Map<String, dynamic> json){ 
        return Service(
            id: json["_id"],
            activeFlag: json["activeFlag"],
            price: json["price"],
            servicePrice: json["servicePrice"],
            totalPrice: json["totalPrice"],
            documents: json["documents"] == null ? [] : List<String>.from(json["documents"]!.map((x) => x)),
            categoryName: json["categoryName"],
            categoryId: json["categoryId"],
            name: json["name"],
            basicFormDetails: json["basicFormDetails"] == null ? [] : List<String>.from(json["basicFormDetails"]!.map((x) => x)),
            formDetailes: json["formDetailes"] == null ? [] : List<FormDetaile>.from(json["formDetailes"]!.map((x) => FormDetaile.fromJson(x))),
            categoryImage: json["categoryImage"],
        );
    }

}

class FormDetaile {
    FormDetaile({
        required this.title,
        required this.inputType,
    });

    final String? title;
    final String? inputType;

    factory FormDetaile.fromJson(Map<String, dynamic> json){ 
        return FormDetaile(
            title: json["title"],
            inputType: json["inputType"],
        );
    }

}
