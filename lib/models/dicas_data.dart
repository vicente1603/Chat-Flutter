import 'package:cloud_firestore/cloud_firestore.dart';

class DicasData {
  String category;
  String id;
  String title;
  String description;
  String image;

  DicasData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    image = snapshot.data["image"];
  }
}
