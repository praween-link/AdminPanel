import 'package:adminpanel/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal.withOpacity(0.8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(58.0),
                    child: Image.asset('assets/img/prifile.png'),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'admin@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.home),
            onTap: () => Get.back(),
          ),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.logout),
            onTap: () {
              Get.to(() => LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
