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
    NoteModel note = NoteModel(
        id: title.text.substring(2).trim(),
        title: title.text,
        subTitle: subTitle.text);
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
    notifyListeners();
  }

  Future<void> updateNote() async {
    currentNote.title = editTitleController.text;
    currentNote.subTitle = editSubTitleController.text;
    await _notesRepository.updateNote(currentNote);
    getAllNotes();
    notifyListeners();
  }

  void deleteNote(String id) async {
    await _notesRepository.deleteNote(id);
    currentNote = NoteModel.empty();
    await getAllNotes();
    notifyListeners();
  }

  void logout(BuildContext context) {
    _authRepository.logout(context);
  }

  void openNote(String id, BuildContext context) async {
    getNote(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteView()),
    );
  }

  void editNote(BuildContext context) {
    editTitleController.text = currentNote.title;
    editSubTitleController.text = currentNote.subTitle;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditNoteView()),
    );
  }
}
