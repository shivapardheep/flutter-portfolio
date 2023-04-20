import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sivaram_portfolio_web/models/projects_model.dart';

class FirebaseProjectsProvider extends ChangeNotifier {
  final List<ProjectModel> _myProjectList = [];
  final List<ProjectModel> _workedProjectList = [];
  //getter
  List<ProjectModel> get getMyProjectList => _myProjectList;
  List<ProjectModel> get getWorkedProjectList => _workedProjectList;

  final users = FirebaseFirestore.instance.collection("images").doc("project");

  getData() async {
    QuerySnapshot querySnapshotMyProject =
        await users.collection("my_project").get();
    QuerySnapshot querySnapshotWorkedProject =
        await users.collection("worked_project").get();
    //
    _myProjectList.clear();
    _workedProjectList.clear();
    for (QueryDocumentSnapshot documentSnapshot
        in querySnapshotMyProject.docs) {
      Object? data = documentSnapshot.data();
      LinkedHashMap<String, dynamic> linkedMap =
          LinkedHashMap<String, dynamic>.from(data as Map<String, dynamic>);
      ProjectModel obj = ProjectModel.fromJson(linkedMap);
      _myProjectList.add(obj);
    }

    for (QueryDocumentSnapshot documentSnapshot
        in querySnapshotWorkedProject.docs) {
      Object? data = documentSnapshot.data();
      LinkedHashMap<String, dynamic> linkedMap =
          LinkedHashMap<String, dynamic>.from(data as Map<String, dynamic>);
      ProjectModel obj = ProjectModel.fromJson(linkedMap);
      _workedProjectList.add(obj);
    }
    notifyListeners();
    print("my project : ${getMyProjectList.length}");
    print("worked project : ${getWorkedProjectList.length}");
  }
}
