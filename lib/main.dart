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
      home: Scaffold(
        appBar: AppBar(title: Text('Photo App')),
        body: Center(child: TakePhotoButton()),
      ),
    );
  }
}

class TakePhotoButton extends StatelessWidget {
  final PhotoManager _photoManager = PhotoManager();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        XFile? photo = await _photoManager.takePhoto();
        if (photo != null) {
          // Handle the photo, e.g., display it or process it
          print('Photo path: ${photo.path}');
          // You can use a callback or a separate function to handle the photo
        }
      },
      child: Text('Take Photo'),
    );
  }
}