import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'photo_manager.dart';

void main() {
  runApp(CocktailColorizerApp());
}

class CocktailColorizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PhotoManager _photoManager = PhotoManager();
  XFile? _photo;

  Future<void> _takePhoto() async {
    XFile? photo = await _photoManager.takePhoto();
    if (photo != null) {
      setState(() {
        _photo = photo;
      });
    }
  }

  Future<void> _choosePhotoFromGallery() async {
    XFile? photo = await _photoManager.pickImageFromGallery();
    if (photo != null) {
      setState(() {
        _photo = photo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _photo != null
                ? Image.file(File(_photo!.path))
                : Text('No photo selected.'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _takePhoto,
              child: Text('Take Photo'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _choosePhotoFromGallery,
              child: Text('Choose Photo from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
