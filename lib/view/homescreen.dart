import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sevika/constants.dart';
import 'package:sevika/model/domain.dart';
import 'package:http/http.dart' as http;
import 'package:sevika/viewmodel/carousel_provider.dart';
import 'package:sevika/server_connection.dart';
import 'package:provider/provider.dart';

import '../common widget/appbar.dart';
import '../drawer.dart';
import 'Services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
              color: maincolor,
              child: MySlideView(),
            ),
      drawer: const drawer(),
    );
  }
}

class MySlideView extends StatefulWidget {
  @override
  _MySlideViewState createState() => _MySlideViewState();
}

class _MySlideViewState extends State<MySlideView> {
  domaindata? data;

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      Provider.of<carouseldata>(context, listen: false)
          .setData(domaindata.fromJson(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<carouseldata>(context).data;
    return CarouselSlider(
      options: CarouselOptions(
        height: 170,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enableInfiniteScroll: true,
      ),
      items: List.generate(data != null ? data!.companyObj!.images!.length : 0,
          (index) {
        return Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Image.network(
              data!.companyObj!.images![index],
              fit: BoxFit.fill,
            ));
      }).toList(),
    );
  }

  Future fetchData() async {
    String url = base_url + "sadmin/checkDomainExist/";
    Map<String, String> headerData = {};
    Map<String, String> postdata = {"domainName": "csc.sevika.online"};
    final response = await postMethodApi(postdata, url, headerData);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Map<String, dynamic> dataList = data.map((item) => domaindata.fromJson(item)).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
