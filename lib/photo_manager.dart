import 'package:image_picker/image_picker.dart';

class PhotoManager {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> takePhoto() async {
    return await _imagePicker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> pickImageFromGallery() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }
}
