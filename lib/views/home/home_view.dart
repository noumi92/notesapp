import 'package:flutter/material.dart';
import 'package:notes_app/view_model/home/home_view_model.dart';
import 'package:notes_app/views/home/add_note_view.dart';
import 'package:provider/provider.dart';

/// View for the home screen of the application.
/// Displays a list of notes and a floating action button to add a new note.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My notes")),
        actions: [
          IconButton(
              onPressed: () {
                homeVM.logout(context);
              },
              icon: Icon(Icons.exit_to_app_sharp)),
        ],
      ),

      /// ListView to display notes
      body: ListView.builder(
          itemCount: homeVM.notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.note_alt),
              title: Text(homeVM.notes[index].title),
              subtitle: Text(homeVM.notes[index].subTitle),
              onTap: () {
                homeVM.openNote(index, context);
              },
            );
          }),

      /// Floating action button to add a new note
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNoteView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
