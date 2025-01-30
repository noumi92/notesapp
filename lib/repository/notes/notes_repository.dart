import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/model/note_model.dart';

/// A repository class which has database of all [notes].
/// It has methods to add a note and get all notes.
/// It uses a list to store the notes.
/// The list is initialized with a sample note.
class NotesRepository {
  final _db = FirebaseFirestore.instance;
  //List<NoteModel> notes = [];
  Future<void> addNote(NoteModel note) async {
    _db.collection("notes").add(note.toJson()).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
    });
  }

  Future<List<NoteModel>> getAllNotes() async {
    List<NoteModel> notes = [];
    await _db.collection("notes").get().then((event) {
      for (var doc in event.docs) {
        notes.add(NoteModel.fromSnapShot(doc));
      }
    });
    return notes;
  }

  void deleteNote(String id) async {
    await _db.collection("notes").doc(id.toString()).delete();
  }

  void updateNote(NoteModel note) async {
    await _db.collection("notes").doc(note.id.toString()).update(note.toJson());
  }

  Future<NoteModel> getNote(String noteId) async {
    final docRef = await _db.collection("notes").doc(noteId).get();
    if (docRef.exists) {
      return NoteModel.fromSnapShot(docRef);
    } else {
      return NoteModel.empty();
    }
  }
}
