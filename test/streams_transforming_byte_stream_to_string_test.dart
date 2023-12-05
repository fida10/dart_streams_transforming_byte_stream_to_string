import 'package:streams_transforming_byte_stream_to_string/streams_transforming_byte_stream_to_string.dart';
import 'package:test/test.dart';

void main() {
  group('Transforming Byte Stream Tests', () {
    test('Transforms stream from bytes to strings and prints chunk sizes',
        () async {
      expect(await transformByteStream(),
          isA<List<int>>()); // Expect a list of chunk sizes
    });
  });
}

