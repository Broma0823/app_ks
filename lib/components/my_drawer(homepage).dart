import 'package:app/components/my_drawer_tiles.dart';
import 'package:app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child:
                Image.asset('assets/images/propertytracker.png', height: 100),
          ),

          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: const Divider(),
          ),

          //tile 1
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),

          //tile 2
          MyDrawerTile(
              text: "S E T T I N G S", icon: Icons.settings, onTap: () {}),

          const Spacer(),

          //tile 3
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () => signUserOut(),
          ),
        ],
      ),
    );
  }
}
