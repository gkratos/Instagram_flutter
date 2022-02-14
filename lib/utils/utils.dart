import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/WIdgets/notification_window.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (XFile != null) {
    return await _file?.readAsBytes();
  }
  print("No image selected");
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

extractFromList(List following) {
  int len = following.length;
  following.forEach((element) {
    // print(FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(element)
    //     .snapshots());
    NotificationWindow(
        snap: FirebaseFirestore.instance
            .collection("users")
            .doc(element)
            .snapshots());
  });
}
