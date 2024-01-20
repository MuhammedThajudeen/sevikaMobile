import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<http.Response> postMethodApi(
    var postData, String strUrl, var header) async {
  http.Client client = http.Client();
  final response = await client
      .post(
        Uri.parse(strUrl),
        headers: header,
        body: jsonEncode(postData),
      )
      .timeout(const Duration(seconds: 30));
  return response;
}

Future<http.Response> getMethodApi(String strUrl, {header}) async {
  http.Client client = http.Client();
  final response = await client
      .get(
        Uri.parse(strUrl),
        headers: header,
      )
      .timeout(const Duration(seconds: 30));
  return response;
}

Future<http.Response> putMethodApi(
    var postData, String strUrl, var header) async {
  http.Client client = http.Client();
  final response = await client
      .put(
        Uri.parse(strUrl),
        headers: header,
        // <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(postData),
      )
      .timeout(const Duration(seconds: 30));

  return response;
}

// Future<http.Response> uploadImage(File file, String filePath) async {
//   // print("file $file text $filePath");
//   String strUrl = url_base + url_file_upload;
//   List<String> listPath = file.path.split("/");
//   List<String> listExtension = listPath.last.toString().split(".");
//   var postUri = Uri.parse(strUrl);
//   var request = http.MultipartRequest("POST", postUri);
//   request.headers["authorization"] = constUserToken;
//   request.fields['pathToBeSave'] = filePath;
//   request.files.add(http.MultipartFile.fromBytes(
//       'file', await file.readAsBytes(),
//       filename: listPath.last.toString(),
//       contentType: MediaType('image', listExtension.last)//listPath.last.toString(),
//       ));
//   // print("headers ${request.headers}");
//   // print("fields ${request.fields}");
//   // print("files.length ${request.files.length}");
//   // print("files.first.length ${request.files.first.length}");
//   // print("files.first.filename ${request.files.first.filename}");
//   http.Response response =
//   await http.Response.fromStream(await request.send());

//   print("RESPONSE $response");
//   print("RESPONSE ${response.body}");
//   return response;
// }

Future<http.Response> deleteMethodApi(String strUrl, {header}) async {
  http.Client client = http.Client();
  final response = await client
      .delete(
        Uri.parse(strUrl),
        headers: header,
      )
      .timeout(const Duration(seconds: 30));
  return response;
}
