// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sevika/constants.dart';
import 'package:sevika/server_connection.dart';
import 'package:sevika/view/homescreen.dart';
import 'package:sevika/viewmodel/login_provider.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: maincolor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                          "assets/images/login_image.png",
                          fit: BoxFit.contain,
                        )),
                    //textfieldname(310, 'Username'),
                    //  customtextfield(450, 'Password')
                  ],
                ),
                customtextfield('Email', usernameController,
                    passwordtext: false, status: 1),
                const SizedBox(
                  height: 20,
                ),
                customtextfield('Password', passwordController,
                    passwordtext: true, status: 2),
                TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color.fromARGB(255, 109, 207, 226)),
                )),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 80, right: 80),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 79, 144),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: TextButton(
                      onPressed: () {
                        loginapi();
                        // Navigator.pushReplacement<void, void>(
                        //   context,
                        //   MaterialPageRoute<void>(
                        //     builder: (BuildContext context) => const HomeScreen()
                        //   ),
                        // );
                        print('username : ${usernameController.text}');
                        print('usernamepass : ${passwordController.text}');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'New to Sevika? Sign Up',
                      style: TextStyle(color: Colors.white),
                    )),
                // SizedBox(height: 50),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     socialmediabutton(FontAwesomeIcons.googlePlusG, 'Google',
                //         const Color(0xffDF4A32)),
                //     socialmediabutton(FontAwesomeIcons.facebookF, 'Facebook',
                //         const Color(0xff39579A))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
    
  }

  Widget customtextfield(String text, TextEditingController controller,
      {required bool passwordtext, required int status}) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        // color: Colors.yellow,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: rowfield(text, controller,
            passwordtext: passwordtext, status: status),
      ),
    );
  }

  rowfield(String? textname, TextEditingController controller,
      {required bool passwordtext, required int status}) {
    final provider = Provider.of<login>(context, listen: false);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextFormField(
          // cursorColor: Colors.black,
          autocorrect: false,
          autofocus: false,
          textCapitalization: TextCapitalization.none,
          keyboardType: TextInputType.text,
          obscureText: status == 2 && provider.showPassword == false,
          textInputAction:
              status == 1 ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 0),
            hintText: textname,
            hintStyle: const TextStyle(
              color: Color(0xffa2a2a2),
              fontSize: 16.0,
              // fontFamily: FONT_PRODUCT_SANS,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.oxygen(
            color: Colors.white,
            fontSize: 15,
            // fontFamily: fontName,
            fontWeight: FontWeight.w400,
          ),
        )),
        Visibility(
          visible: passwordtext,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 30,
              // color: Colors.green,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (provider.showPassword == true) {
                      provider.setShowPassword(false);
                    } else {
                      provider.setShowPassword(true);
                    }
                  },
                  icon: Icon(
                    provider.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget socialmediabutton(IconData icon, String label, Color bgcolor) {
    return Container(
      height: 50,
      width: 150,
      decoration:
          BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(8)),
      child: TextButton.icon(
          onPressed: () {},
          icon: FaIcon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  loginapi() async {

    String strUrl = base_url + login_url;

    var postData = {
      "mobile" : usernameController.text,
        "email": '',
        "password": passwordController.text
      };

    var headerData = {
        '': '',
      };
    
    try {
        final response = await postMethodApi(postData, strUrl, headerData);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = json.decode(response.body);

          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomeScreen()
            ),
          );
        }
        else{
          // showAlert("Failed to login, please try again later");
        }
      } on SocketException catch (_) {
        print("Socket exception api call!!!!");
      } on TimeoutException catch (_) {
        print("timeout exception api call!!!");
      }
  }
}
