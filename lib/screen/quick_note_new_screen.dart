import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuickNoteNewScreen extends StatefulWidget {
  const QuickNoteNewScreen({super.key});

  @override
  State<QuickNoteNewScreen> createState() => _QuickNoteNewScreenState();
}

class _QuickNoteNewScreenState extends State<QuickNoteNewScreen> {
  QuillController quillController = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jot Quick Thoughts")),
      body: Column(
        children: [
          QuillSimpleToolbar(
            controller: quillController,
            config: QuillSimpleToolbarConfig(
              showColorButton: false,
              showCodeBlock: false,
              buttonOptions: QuillSimpleToolbarButtonOptions(
                base: QuillToolbarBaseButtonOptions(
                  iconSize: 15,
                  iconTheme: QuillIconTheme(
                    iconButtonSelectedData: IconButtonData(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: quillController,
              config: QuillEditorConfig(autoFocus: true),
            ),
          ),
        ],
      ),
    );
  }
}
