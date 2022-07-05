import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local file read/write Demo',
      home: ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();

  static const String klocalFileName = 'demo_localFile.txt';
  String _localFileContent = '';
  String _localFilePath = klocalFileName;

  @override
  void initState() {
    super.initState();
    this._readTextFromLocalFile();
    this._getLocalFile.then((file) => setState(() => this._localFilePath = file.path));

  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Local file read/write Demo',
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Text(
            'Write to local file',
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            focusNode: textFieldFocusNode,
            controller: _textController,
            maxLines: null,
            style: TextStyle(fontSize: 20),
          ),
          ButtonBar(
            children: [
              MaterialButton(
                onPressed: () async {
                  this._readTextFromLocalFile();
                  this._textController.text = this._localFileContent;
                  FocusScope.of(context).requestFocus(textFieldFocusNode);
                  log('String successfuly loaded from local file');
                },
                child: Text(
                  'Load',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  await this._writeTextToLocalFile(this._textController.text);
                  this._textController.clear();
                  await this._readTextFromLocalFile();
                   log('String successfuly written to local file');
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Divider(
            height: 20.0,
          ),
          Text(
            'Local file path:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            this._localFilePath,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Divider(
            height: 20.0,
          ),
          Text(
            'Local file content:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            this._localFileContent,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/$klocalFileName');
  }

  Future<File> _writeTextToLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'Error loading local file: $e';
    }
    setState(() {
      this._localFileContent = content;
    });
  }
}
