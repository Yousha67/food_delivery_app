import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:food_delivery_app/services/path_provider_service.dart';
class ImageResizer {
  final PathProviderService pathProviderService;

  ImageResizer({required this.pathProviderService});

  Future<File> resizeImageIfNeeded(String filePath, {int? width, int? height}) async {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception("File does not exist");
    }

    final imageBytes = await file.readAsBytes();
    if (imageBytes.isEmpty) {
      throw Exception("Image data is empty");
    }

    final originalImage = img.decodeImage(imageBytes);
    if (originalImage == null) {
      throw Exception("Failed to decode image");
    }

    img.Image resizedImage = originalImage;

    if (width != null && width < originalImage.width) {
      resizedImage = img.copyResize(resizedImage, width: width);
    }

    if (height != null && height < originalImage.height) {
      resizedImage = img.copyResize(resizedImage, height: height);
    }

    final directory = await pathProviderService.getApplicationDocumentsDirectory();
    final resizedFilePath = '${directory.path}/resized_${file.uri.pathSegments.last}';
    final resizedFile = File(resizedFilePath);

    resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage)!);
    return resizedFile;
  }

  Future<Map<String, int>> getImageDimensions(File file) async {
    final imageBytes = await file.readAsBytes();
    final image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception('Failed to decode image for dimensions.');
    }
    return {'width': image.width, 'height': image.height};
  }
}
