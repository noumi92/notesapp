import 'package:flutter/material.dart';
import 'package:notes_app/common/widgets/app_bar/app_bar.dart';
import 'package:notes_app/views/home/home_view.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';

/// View for adding a new note.
class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  Widget build(BuildContext context) {
    print("build called");
    final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
        appBar: const TAppBar(title: "Edit Note"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 24.0),

              /// TextField for note title
              TextField(
                controller: homeVM.editTitleController,
                onChanged: (value) {
                  setState(() {
                    homeVM.editTitleController.text = value;
                  });
                },
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
                maxLines: 10,
                controller: homeVM.editSubTitleController,
                onChanged: (value) {
                  setState(() {
                    homeVM.editSubTitleController.text = value;
                  });
                },
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        homeVM.updateNote();
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Text("Update Note"),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        homeVM.deleteNote(homeVM.currentNote.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                      child: const Text("Delete Note")),
                ],
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }
}
