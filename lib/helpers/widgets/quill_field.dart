import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillField extends StatefulWidget {
  const QuillField(
      {super.key, required this.preFilledValue, required this.onChanged});
  final String preFilledValue;
  final void Function(String) onChanged;
  @override
  State<QuillField> createState() => _QuillFieldState();
}

class _QuillFieldState extends State<QuillField> {
  final _controller = QuillController.basic();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: QuillEditor.basic(
            configurations: QuillEditorConfigurations(controller: _controller),
          ),
        ),
      ],
    );
  }
}
