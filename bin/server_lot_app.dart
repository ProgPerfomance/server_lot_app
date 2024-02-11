
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

Router router = Router();
void main(List<String> arguments) {
  router.post('registration', (Request request) async {
    var jsonString = await request.readAsString();
    var data = jsonDecode(jsonString);
    developer.log('Registration request');
    developer.log(data.toString());
  });

  var server = serve(router, '63.251.122.116', 2310);
}
