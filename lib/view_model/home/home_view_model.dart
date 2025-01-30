import 'package:flutter/cupertino.dart';
import 'package:notes_app/repository/auth/auth_repository.dart';
import 'package:notes_app/repository/notes/notes_repository.dart';

import '../../model/note_model.dart';

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

  void updateNote(NoteModel note) {
    _notesRepository.updateNote(note);
    getAllNotes();
    notifyListeners();
  }

  void deleteNote(String id) {
    _notesRepository.deleteNote(id);
    getAllNotes();
    notifyListeners();
  }

  void logout(BuildContext context) {
    _authRepository.logout(context);
  }
}
