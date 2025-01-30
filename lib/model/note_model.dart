import 'package:cloud_firestore/cloud_firestore.dart';

/// Class to represent a note in the application.
/// It has three properties: [id], [title], and [subTitle].
class NoteModel {
  String id, title, subTitle;

  NoteModel({required this.id, required this.title, required this.subTitle});

  static NoteModel empty() => NoteModel(id: "", title: "", subTitle: "");

  Map<String, dynamic> toJson() {
    final note = <String, dynamic>{
      "id": id,
      "title": title,
      "sub_title": subTitle,
    };
    return note;
  }

  factory NoteModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return NoteModel(
        id: document.id,
        title: data['title'] ?? '',
        subTitle: data['sub_title'] ?? '',
      );
    } else {
      return NoteModel.empty();
    }
  }
}
