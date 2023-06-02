import 'package:coupinos_using_getx_api/models/coupinos_model.dart';
import 'package:coupinos_using_getx_api/remote_service/remote_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CoupinosController extends GetxController {
  @override
  void onInit(){
    fetchcontactDetails();
    fetchaddressDetails();
    super.onInit();
  }

  var contactList = <ContactPerson>[].obs;
  var addressList = <Address>[].obs;
  //RxList<ContactPerson> contactList = RxList<ContactPerson>();

   void fetchcontactDetails() async {
      var contacts = await RemoteServices().fetchcontact();
      if(contacts!= null){
        contactList.add(contacts);
        //contactList.value = contacts as List<ContactPerson>;
      }
  }

  void fetchaddressDetails() async {
     var addres = await RemoteServices().fetchaddress();
     if(addres!= null){
       addressList.add(addres);
     }
  }
}