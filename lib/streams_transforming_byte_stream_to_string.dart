/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/streams_transforming_byte_stream_to_string_base.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/*
Practice Question 1: Transforming Byte Stream to String
Task:

Transform the stream of bytes from an HTTP response into strings and print the length of each data chunk. 
Implement error handling and ensure to close the client when the stream is finished.
 */

Future<List<int>> transformByteStream() async {
  final url = 'https://jsonplaceholder.typicode.com/todos/1';
  final urlAsURL = Uri.parse(url);

  final response = Future(() => http.get(urlAsURL));
  final responseAsStream = Stream.fromFuture(response);

  List<int> ans = [];
  responseAsStream.listen((event) { 
    print(event.contentLength);
    ans.add(event.contentLength!);
  });

  return ans;
}

Future<void> main() async {
  transformByteStream();
}