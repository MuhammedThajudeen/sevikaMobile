import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sevika/constants.dart';
import 'package:sevika/screens/Services.dart';
import 'package:sevika/screens/about.dart';
import 'package:sevika/screens/homescreen.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: maincolor,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            curve: Curves.easeInCirc,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
              color: Color.fromARGB(255, 133, 172, 250),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 133, 172, 250)),
              accountName: Text(
                "Abhishek Mishra",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.home_outlined,color: Colors.white,),
            title:  Text(' Home ',style: GoogleFonts.poppins(
                color: Colors.white,
          fontSize: 16,
            ),),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.computer_sharp,color: Colors.white),
            title:  Text(' Services ',style: GoogleFonts.poppins(
                color: Colors.white,
          fontSize: 16,
            )),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const Services()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined,color: Colors.white),
            title:  Text(' About ',style: GoogleFonts.poppins(
                color: Colors.white,
          fontSize: 16,
            )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.video_label),
          //   title: const Text(' Saved Videos '),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.edit),
          //   title: const Text(' Edit Profile '),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text('LogOut'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
