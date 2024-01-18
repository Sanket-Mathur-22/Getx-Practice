import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/counter_controller.dart';
import 'package:getx_practice/controllers/example_controller.dart';
import 'package:getx_practice/controllers/image_picket_controller.dart';
import 'package:getx_practice/controllers/login_controller.dart';
import 'package:getx_practice/controllers/notification_controller.dart';
import 'package:getx_practice/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterController controller = Get.put(CounterController());
  ExampleTwoController twocontroller = Get.put(ExampleTwoController());
  NotificationController notificationController = Get.put(NotificationController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  LoginController loginController = Get.put(LoginController());

  // double opacity = .4;
  //bool notifications = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
        actions: [
          PopupMenuButton(itemBuilder: (context)=>[
            PopupMenuItem(child: 
            Text("Add item"))
          ]),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Getx Dialog alert"),
                subtitle: Text("Getx subtitle"),
                onTap: () {
                  Get.defaultDialog(
                      title: "Delete",
                      titlePadding: EdgeInsets.only(top: 20),
                      contentPadding: EdgeInsets.all(20),
                      middleText: "Are you sure you want to delete",
                      textConfirm: 'Yes',
                      textCancel: "No");
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Getx Bottom Sheet"),
                subtitle: Text("Getx subtitle"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.bottomSheet(Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.light_mode,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Light theme",
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.dark_mode,
                            color: Colors.black,
                          ),
                          title: Text("Dark theme",
                              style: TextStyle(color: Colors.black)),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),
            // Center(child: Obx(() {
            //   return Text(
            //     controller.counter.toString(),
            //     style: TextStyle(fontSize: 60),
            //   );
            // })),
            SizedBox(
              height: 12,
            ),
            Obx(
              () => Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(twocontroller.opacity.value),
              ),
            ),
            Obx(
              () => Slider(
                  value: twocontroller.opacity.value,
                  onChanged: (value) {
                    twocontroller.setOpacity(value);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  Obx(() => Switch(
                      value: notificationController.notification.value,
                      onChanged: (value) {
                        //value = true;
                        notificationController.changeNotification(value);
                      })),
                ],
              ),
            ),
            Card(
              child: ListTile(
                title: Text("ABC"),
                trailing: Icon(Icons.favorite),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("ABC"),
                trailing: Icon(Icons.favorite),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {
                      imagePickerController.getImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt_rounded),
                    label: Text("Camera")),
                TextButton.icon(
                    onPressed: () {
                      imagePickerController.getImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.camera),
                    label: Text("Gallery")),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.Increment();
      //   },
      // ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: imagePickerController.imagePath.isNotEmpty
                      ? FileImage(
                          File(imagePickerController.imagePath.toString()))
                      : null),
            ],
          ),
        ),
      ),
    );
  }
}
