import 'package:adminpanel/controller/user.dart';
import 'package:adminpanel/view/add_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_user.dart';
import 'widgets/drawer.dart';
import 'widgets/user_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Panel'),
        ),
        body: Obx(
          () => Column(
            children: [
              // TITLE HEADER
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'ADMIN PANEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          wordSpacing: 5,
                        ),
                      ),
                      Text(
                        'ALL USERS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          wordSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Colors.teal, boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                    color:
                        const Color.fromARGB(255, 3, 93, 84).withOpacity(0.5),
                    offset: const Offset(2, 2),
                    spreadRadius: 5,
                  ),
                  const BoxShadow(
                    blurRadius: 0,
                    blurStyle: BlurStyle.normal,
                    color: Colors.teal,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ]),
              ),
              const SizedBox(height: 10),
              // LIST OF USERS
              Expanded(
                child: userController.users.isEmpty
                    ? const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: userController.users.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: UserTile(user: userController.users[index]),
                            onTap: () => Get.to(() => UserView(
                                  user: userController.users[index],
                                )),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        // NEW USER ADD BUTTON
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const AddUser());
          },
          child: const Icon(Icons.add),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
