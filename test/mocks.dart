import 'dart:io';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:food_delivery_app/services/path_provider_service.dart'; // Adjust import path

class MockPathProviderService extends Mock implements PathProviderService {}

PathProviderService getMockPathProviderService() {
  final mock = MockPathProviderService();

  // Mock a valid directory path for testing
  when(() => mock.getApplicationDocumentsDirectory()).thenAnswer(
        (_) async => Directory('/mock/path/to/documents'),
  );

  return mock;
}
