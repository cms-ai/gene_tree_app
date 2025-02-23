import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/interceptor/app_interceptor.dart';
import 'package:mocktail/mocktail.dart';

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

void main() {
  late AppInterceptor appInterceptor;

  setUp(() {
    appInterceptor = AppInterceptor();
  });

  group('AppInterceptor', () {
    test('onRequest should forward the request without modification', () {
      // Arrange
      final mockHandler = MockRequestInterceptorHandler();
      final options = RequestOptions(path: '/test');

      // Act
      appInterceptor.onRequest(options, mockHandler);

      // Assert
      verify(() => mockHandler.next(options)).called(1);
    });

    test('onResponse should forward the response without modification', () {
      // Arrange
      final mockHandler = MockResponseInterceptorHandler();
      final response = Response(
        requestOptions: RequestOptions(path: '/test'),
        data: 'response_data',
        statusCode: 200,
      );

      // Act
      appInterceptor.onResponse(response, mockHandler);

      // Assert
      verify(() => mockHandler.next(response)).called(1);
    });

    test('onError should forward the error without modification', () {
      // Arrange
      final mockHandler = MockErrorInterceptorHandler();
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        error: 'error_message',
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
        ),
      );

      // Act
      appInterceptor.onError(error, mockHandler);

      // Assert
      verify(() => mockHandler.next(error)).called(1);
    });
  });
}
