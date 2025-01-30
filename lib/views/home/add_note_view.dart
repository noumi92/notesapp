import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';

/// View for adding a new note.
class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add note"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),

            /// TextField for note title
            TextField(
              controller: homeVM.title,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              autofocus: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  label: const Text("Title"),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 24.0),

            /// TextField for note description
            TextField(
              maxLines: 5,
              controller: homeVM.subTitle,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              autofocus: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  label: const Text("Description about note"),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
                onPressed: () {
                  homeVM.addNote(context);
                  Navigator.pop(context);
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
