
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:mysql_client/mysql_client.dart';
import 'package:server_lot_app/server_lot_app.dart';
import 'package:server_lot_app/user/authorization_user.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

Router router = Router();

void main(List<String> arguments) async{
  var sql = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '1234567890',
      databaseName: 'lot');
  await sql.connect();
 ;
  router.post('/registration', (Request request) async {
    var jsonString = await request.readAsString();
    var data = jsonDecode(jsonString);
    developer.log('Registration request');
    developer.log(data.toString());
  AuthUser.registrationUser(data, sql);
   return Response.ok('uid');
  });

  var server = serve(router, '63.251.122.116', 2310);
}
