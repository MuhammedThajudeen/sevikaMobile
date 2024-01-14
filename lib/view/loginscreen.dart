import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevika/constants.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: maincolor,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
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
                      Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.asset(
                            "assets/images/login_image.png",
                            fit: BoxFit.contain,
                          )),
                      //textfieldname(310, 'Username'),
                      Positioned(top: 360, child: customtextfield('Username')),
                      //  customtextfield(450, 'Password')
                    ],
                  ),
                ),
                customtextfield('Password'),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'New to Sevika? Sign Up',
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 80,right: 80),
                  height: 50,
                  width : MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 79, 144),
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialmediabutton(FontAwesomeIcons.googlePlusG, 'Google', const Color(0xffDF4A32)),
                    socialmediabutton(FontAwesomeIcons.facebookF, 'Facebook', const Color(0xff39579A))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textfieldname(double top, String text) {
    return Positioned(
      top: top,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget customtextfield(
    String text1,
  ) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: text1,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            errorStyle: const TextStyle(fontSize: 18.0),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)))),
      ),
    );
  }

  Widget socialmediabutton(IconData icon, String label, Color bgcolor){
    return Container(
      
      height: 50,
      width: 150,
    
      decoration: BoxDecoration(color: bgcolor,
      borderRadius: BorderRadius.circular(8)),
      child: TextButton.icon(onPressed: (){}, icon: FaIcon(icon,color: Colors.white,), label: Text(label,style: TextStyle(color: Colors.white),)),
    );
  }
}
