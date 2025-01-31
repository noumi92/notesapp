import 'package:flutter/material.dart';
import 'package:notes_app/repository/auth/auth_repository.dart';
import 'package:notes_app/repository/notes/notes_repository.dart';

import '../../model/note_model.dart';
import '../../views/home/edit_note_view.dart';
import '../../views/home/note_view.dart';

/// ViewModel class for managing notes in the application.
/// It provides methods to add a note and get all notes.
class HomeViewModel with ChangeNotifier {
  final NotesRepository _notesRepository = NotesRepository();
  final AuthRepository _authRepository = AuthRepository();
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;
  NoteModel currentNote = NoteModel.empty();
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editSubTitleController = TextEditingController();

  /// Add a note to the repository.
  Future<void> addNote(BuildContext context) async {
    NoteModel note = NoteModel(id: "id", title: "title", subTitle: "subTitle");
    await _notesRepository.addNote(note);
    _notes = await _notesRepository.getAllNotes();
    notifyListeners();
  }

  Future<void> getAllNotes() async {
    _notes = await _notesRepository.getAllNotes();
    notifyListeners();
  }

  Future<void> getNote(String noteId) async {
    currentNote = await _notesRepository.getNote(noteId);
    editTitleController.text = currentNote.title;
    editSubTitleController.text = currentNote.subTitle;
  }

  Future<void> updateNote(NoteModel note) async {
    await _notesRepository.updateNote(note);
    getAllNotes();
    notifyListeners();
  }

  void deleteNote(String id) async {
    await _notesRepository.deleteNote(id);
    getAllNotes();
    notifyListeners();
  }

  void logout(BuildContext context) {
    _authRepository.logout(context);
  }

  void openNote(int index, BuildContext context) async {
    await getNote(notes[index].id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteView(noteId: currentNote.id)),
    );
  }

  void editNote(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditNoteView(noteId: currentNote.id)),
    );
  }
}
