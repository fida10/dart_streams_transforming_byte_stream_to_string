/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/streams_transforming_byte_stream_to_string_base.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/*
Practice Question 1: Transforming Byte Stream to String
Task:

Transform the stream of bytes from an HTTP response into strings and print the length of each data chunk. 
Implement error handling and ensure to close the client when the stream is finished.
 */

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<int>> transformByteStream() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  final client = http.Client();
  List<int> chunkSizes = [];

  try {
    final request = http.Request('GET', url);
    final response = await client.send(request);

    await for (var chunk in response.stream.transform(utf8.decoder)) {
      print('Chunk size: ${chunk.length}');
      chunkSizes.add(chunk.length);
    }
  } catch (e) {
    print('An error occurred: $e');
  } finally {
    client.close();
    print('Client closed');
  }

  return chunkSizes;
}


Future<void> main() async {
  transformByteStream();
}
