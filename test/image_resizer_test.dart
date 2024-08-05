import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery_app/services/path_provider_service.dart';
import 'package:food_delivery_app/utils/image_resizer.dart';
import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockPathProviderService = getMockPathProviderService();

  group('ImageResizer', () {
    late ImageResizer imageResizer;
    late String testImagePath;

    setUpAll(() async {
      imageResizer = ImageResizer(pathProviderService: mockPathProviderService);
      final directory = await mockPathProviderService.getApplicationDocumentsDirectory();

      final mockDirectory = Directory(directory.path);
      if (!mockDirectory.existsSync()) {
        mockDirectory.createSync(recursive: true);
      }

      testImagePath = '${directory.path}/test_image.jpg';

      final testImage = File('test/assets/test_image.jpg');
      if (!testImage.existsSync()) {
        throw Exception('Test image file does not exist at ${testImage.path}');
      }

      final imageFile = File(testImagePath);
      await imageFile.writeAsBytes(await testImage.readAsBytes());
    });

    test('onResizeImageIfNeeded_whenHeightIsNotNull_shouldResize_returnResizedFile', () async {
      final resizedFile = await imageResizer.resizeImageIfNeeded(testImagePath, height: 500);

      expect(resizedFile, isNotNull);
      final dimensions = await imageResizer.getImageDimensions(resizedFile);
      expect(dimensions['height'], equals(500));
    });
  });
}
