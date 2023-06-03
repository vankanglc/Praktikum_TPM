import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String _imagePath = "";
  final ImagePicker _picker = ImagePicker();
  Future<String> getImage(bool isCamera) async {
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image!.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera and Gallery"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              'images/photo.jpg',
              width: 250.0,
              height: 250.0,
            ),
            SizedBox(height: 15.0),
            new SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton.icon(
                onPressed: () async {
                  _imagePath = await getImage(false);
                  setState(() {});
                },
                icon: Icon(Icons.insert_drive_file),
                label: Text("Gallery"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            new SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton.icon(
                onPressed: () async {
                  _imagePath = await getImage(true);
                  setState(() {});
                },
                icon: Icon(Icons.camera_alt),
                label: Text("Camera"),
              ),
            ),
            _imagePath.isEmpty
                ? Container()
                : Image.file(
                    File(_imagePath),
                    height: 300,
                    width: 300,
                  ),
          ],
        ),
      ),
    );
  }
}
