import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseProjectsProviderProvider extends ChangeNotifier {
  final users = FirebaseFirestore.instance
      .collection("images")
      .doc("project")
      .collection("my_project");

  getData() async {
    users.snapshots().map((event) {});
  }
}
