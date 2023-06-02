import 'dart:convert';

import 'package:coupinos_using_getx_api/models/coupinos_model.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static var client = http.Client();
  ContactPerson? contDetails;

  Address? adrDetails;
  // static Future<ContactPerson?> fetchcontactDetails() async {
  //  var response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
  //    headers: <String, String>{
  //      'Content-Type': 'application/json; charset=UTF-8',
  //    },
  //    body: jsonEncode(<String, String>{
  //      'email': 'learntest43+1@gmail.com',
  //      'password': 'Test@123',
  //    }),
  //  );
  //  var data = jsonDecode(response.body);
  //  print(data);
  //  //print("Text"+ '${RemoteServices.contDetails!.email}');
  //  if (response.statusCode == 200) {
  //    // for (Map<String, dynamic> index in data1) {
  //    contDetails = ContactPerson.fromJson(data["contactPerson"]);
  //    // }
  //    print(contDetails!.email);
  //    return contDetails;
  //  } else {
  //    return contDetails;
  //  }
  // }


  Future<ContactPerson?> fetchcontact() async {
    var response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'learntest43+1@gmail.com',
        'password': 'Test@123',
      }),
    );
    var data = jsonDecode(response.body);
    //print(data);
    print(data['contactPerson']);
    if (response.statusCode == 200) {
      // for (Map<String, dynamic> index in data1) {
      contDetails = ContactPerson.fromJson(data["contactPerson"]);
      // }
      // print(contDetails.values);
      return contDetails;
    } else {
      return contDetails;
    }
  }

  Future<Address?> fetchaddress() async {
    var response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'learntest43+1@gmail.com',
        'password': 'Test@123',
      }),
    );
    var data = jsonDecode(response.body);
    //print(data);
    print(data['address']);
    if (response.statusCode == 200) {
      // for (Map<String, dynamic> index in data1) {
      adrDetails = Address.fromJson(data["address"]);
      // }
      // print(contDetails.values);
      return adrDetails;
    } else {
      return adrDetails;
    }
  }
}