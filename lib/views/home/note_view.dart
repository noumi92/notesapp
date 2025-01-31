import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';

/// View for adding a new note.
class NoteView extends StatelessWidget {
  final String noteId;
  const NoteView({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    homeVM.getNote(noteId);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Note"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),

            /// TextField for note title
            Text(homeVM.currentNote.title,
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 24.0),

            /// TextField for note description
            Text(homeVM.currentNote.subTitle,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    homeVM.editNote(context);
                  },
                  child: const Text("Edit Note")),
            ),
          ],
        ),
      ),
    );
  }
}
