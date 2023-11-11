import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sevika/server_connection.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common widget/appbar.dart';
import '../constants.dart';
import '../drawer.dart';
import '../models/service_model.dart';
import '../provider/services_provider.dart';
import 'homescreen.dart';
import 'package:provider/provider.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  Services_model? data;

  @override
  void initState() {
    super.initState();
    serviceapi().then((value) {
      Provider.of<Servicesdata>(context, listen: false)
          .setData(Services_model.fromJson(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<Servicesdata>(context).data;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: appbar(),
        drawer: drawer(),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: maincolor,
            child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Services',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    )
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: data != null ? data!.services.length : 0,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Replace the following with your logo widget
                            Image.network(
                              data!.services[index].categoryImage.toString(),
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data!.services[index].name.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future serviceapi() async {
    final strurl = base_url + 'sadmin/fetchPublishedServices/';
    final response = await getMethodApi(strurl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
