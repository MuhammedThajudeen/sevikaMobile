import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sevika/common%20widget/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevika/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer.dart';
import 'homescreen.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: appbar(),
        drawer: drawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: maincolor),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Headingcontainer(heading: "About Sevika CSC"),
                AboutContent(content: aboutsevika),
                const Headingcontainer(heading: 'Our Mission'),
                AboutContent(content: missionsevika),
                const Headingcontainer(heading: 'Why Choose Sevika CSC?'),
                AboutContent(content: whysevika),
                const Headingcontainer(heading: 'Get Started Today'),
                AboutContent(content: getstarted),
                Footercontainer(titletext: 'Find us', contenttext: '673582, kozhikode, kerala', icondata: Icons.location_city, ontaplink: mapUrl,),
                Footercontainer(titletext: 'Call us', contenttext: '8195927224', icondata: Icons.phone, ontaplink: telephone,),
                Footercontainer(titletext: 'Mail us', contenttext: 'sevika12@gmail.com', icondata: Icons.mail, ontaplink: email,),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
String email = 'mailto:sevika12@gmail.com?';
String telephone = 'tel:8195927224';
String mapUrl = 'https://www.google.com/maps/place/HiLITE+Mall/@11.2486635,75.8286021,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba65bbe359ced81:0xc17c381f72b87e02!8m2!3d11.2486583!4d75.833473!16s%2Fm%2F0j3cwv7?entry=ttu';
String aboutsevika =
    "Welcome to Sevika Citizen Service Centre (Sevika CSC), your trusted partner in delivering seamless and hassle-free citizen services right to your doorstep. At Sevika CSC, we understand the importance of easy access to essential services, and we are dedicated to making your life more convenient";
String missionsevika =
    "Our mission at Sevika CSC is to empower every citizen by providing a comprehensive platform for availing a wide range of personal services. We aim to eliminate the need for multiple visits to government offices and the complexities that often accompany them. With us, you can access services such as passport application, tax filings, land tax assessments, and PAN card processing—all from the comfort of your home.";
String whysevika =
    ' - Convenience: Say goodbye to long queues and paperwork. With Sevika CSC, you can complete important tasks from your home, saving you time and effort. \n - Trust: We prioritize the security and privacy of your personal information. You can trust us to handle your data with the utmost care. \n - Expert Guidance: Our team of experts is here to assist you every step of the way, ensuring a smooth and trouble-free experience. \n - Accessibility: Sevika CSC is designed with user-friendliness in mind. Our platform is accessible to individuals of all backgrounds and ages.';
String getstarted = "Sevika CSC is committed to simplifying the process of accessing citizen services. Join us today, and experience a more efficient, secure, and accessible way to complete your essential tasks. Your convenience is our priority. For any inquiries or assistance, please don't hesitate to contact us. Sevika Citizen Service Centre - Making life easier, one service at a time.";

class Footercontainer extends StatelessWidget {
  const Footercontainer({super.key, required this.titletext, required this.contenttext, required this.icondata,  required this.ontaplink});
 final String titletext;
 final String contenttext;
 final IconData icondata;
 final  String ontaplink;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        var url = Uri.parse(ontaplink);
          await launchUrl(url);
        
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 3),
          borderRadius: BorderRadius.circular(18)
        ),
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 15,left: 18,right: 18),
        child: ListTile(
          title: Text(titletext,
          style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
          leading: Icon(icondata,color: Colors.white,),
          subtitle: Text(contenttext,
          style: GoogleFonts.workSans(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        )),
        ),
      ),
    );
  }

}

class Headingcontainer extends StatelessWidget {
  const Headingcontainer({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        heading,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: Text(
        content,
        style: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
