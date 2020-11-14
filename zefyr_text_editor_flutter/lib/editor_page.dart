import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {

  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    final document = _localDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
    // super.initState();
  }

  NotusDocument _localDocument() {
    final Delta delta = Delta()..insert("Insert Text here\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
      ),
      body: Container(
        child: ZefyrScaffold(
          child: ZefyrEditor(
            padding: EdgeInsets.all(5.0),
            controller: _controller,
            focusNode: _focusNode,
          ),
        ),
      )
    );
  }
}