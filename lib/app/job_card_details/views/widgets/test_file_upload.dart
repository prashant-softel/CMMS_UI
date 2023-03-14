import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FileUploader extends StatefulWidget {
  @override
  _FileUploaderState createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  List<File> files = [];

  void _onDrop(var event) {
    event.preventDefault();
    event.dataTransfer!.files.forEach((file) {
      if (!files.contains(file)) {
        setState(() {
          files.add(file);
        });
      }
    });
  }

  void _onFileRemove(int index) {
    setState(() {
      files.removeAt(index);
    });
  }

  Future<void> _onSubmit() async {
    for (File file in files) {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.relativePath ?? '',
          filename: file.name,
        ),
      });

      final dio = Dio();
      final response = await dio.post(
        'https://your-upload-api.com',
        data: formData,
        onSendProgress: (sent, total) {
          print('Sent: $sent, Total: $total');
        },
      );

      print('Upload response: ${response.statusCode}');
    }

    setState(() {
      files.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DragTarget(
          onAccept: _onDrop,
          builder: (context, candidates, rejects) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  'Drop files here',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            files.length,
            (index) => Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      files[index].name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: () => _onFileRemove(index),
                    child: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: files.isEmpty ? null : _onSubmit,
          child: Text('Upload Files'),
        ),
      ],
    );
  }
}
