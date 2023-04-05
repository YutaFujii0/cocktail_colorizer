import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'image_processor.dart';
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
  final ImageProcessor _imageProcessor = ImageProcessor();
  XFile? _photo;
  img.Image? _processedImage;

  Future<void> _takePhoto() async {
    XFile? photo = await _photoManager.takePhoto();
    if (photo != null) {
      setState(() {
        _photo = photo;
      });
      _processImage(photo);
    }
  }

  Future<void> _choosePhotoFromGallery() async {
    XFile? photo = await _photoManager.pickImageFromGallery();
    if (photo != null) {
      setState(() {
        _photo = photo;
      });
      _processImage(photo);
    }
  }

  Future<void> _processImage(XFile photo) async {
    img.Image processedImage = await _imageProcessor.processImage(photo);
    setState(() {
      _processedImage = processedImage;
    });
  }

  @override
  void initState() {
    super.initState();
    _imageProcessor.loadModel();
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
