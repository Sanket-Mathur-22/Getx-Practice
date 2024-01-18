import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage(ImageSource) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
