import 'dart:convert';
import 'package:coupinos_using_getx_api/controllers/coupinos_contoller.dart';
import 'package:coupinos_using_getx_api/remote_service/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/coupinos_model.dart';
class CoupinosHomeScreen extends StatelessWidget {
  CoupinosHomeScreen({Key? key}) : super(key: key);

   final CoupinosController coupinosController = Get.put(CoupinosController());
   String baseUrl = 'https://coupinos-app.azurewebsites.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          radius: 35,
          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu-JxuDBGV26p7Q2Tq-3L9By2CGBrixYvtKg&usqp=CAU'),
        ),
        title: const Text("Coupinos-Login Using Getx", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 20, color: Colors.black,)),
          const SizedBox(width: 1,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, size: 20, color: Colors.black,)),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi There", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
              Expanded(
                  child: Obx(() => ListView.builder(
                          itemCount: coupinosController.contactList.length,
                            itemBuilder: (context, index) {

                            //return Text('${coupinosController.contactList[index].email}');
                            return Column(
                              children: [
                                Container(
                                  child:  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 150,
                                    child: CircleAvatar(
                                      radius: 115,
                                      backgroundImage: NetworkImage(baseUrl+'${coupinosController.contactList[index].profilePic}'),
                                    ),
                                  ),
                                  // Image.network(baseUrl+'${contDetails!.profilePic}'),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10,),
                                Text('Name: '+'${coupinosController.contactList[index].firstName}' + " " +'${coupinosController.contactList[index].lastName}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text("Email-Id: "+'${coupinosController.contactList[index].email}',style: TextStyle(fontSize: 20, color: Colors.blue)),
                                SizedBox(height: 10,),
                                Text("DOB: "+'${coupinosController.contactList[index].dob!.day}'+'/'+'${coupinosController.contactList[index].dob!.month}'+'/'+'${coupinosController.contactList[index].dob!.year}', style: TextStyle(fontSize: 20,)),
                                SizedBox(height: 10,),
                                Text("Gender: "+'${coupinosController.contactList[index].gender}', style: TextStyle(fontSize: 20)),
                                SizedBox(height: 40,),
                              ],
                            );
                            }),
                  )
    ),
              Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: coupinosController.addressList.length,
                      itemBuilder: (context, index) {

                        //return Text('${coupinosController.contactList[index].email}');
                        return Column(
                          children: [
                            Text("Residential Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                            SizedBox(height: 10,),
                            Text('Street: '+'${coupinosController.addressList[index].street}', style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            Text("City: "+'${coupinosController.addressList[index].city}',style: TextStyle(fontSize: 20)),
                            SizedBox(height: 10,),
                            Text("Country "+'${coupinosController.addressList[index].country}', style: TextStyle(fontSize: 20,)),
                            SizedBox(height: 10,),
                            Text("Postal Code: "+'${coupinosController.addressList[index].postalCode}', style: TextStyle(fontSize: 20)),
                          ],
                        );
                      }),
                  )
              ),
            ],
          ),
        ),
    );
  }
}
