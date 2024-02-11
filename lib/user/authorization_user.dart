import 'package:mysql_client/mysql_client.dart';
import 'package:uuid/uuid.dart';


Future<void> registrationUser(request) async {
var  sql = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'root',
      password: '1234567890',
      databaseName: 'lot');
  await sql.connect();
  Uuid uuid = Uuid();
String uuidString = uuid.v1();
await  sql.execute("insert into users (id, uuid, email, phone, first_name, last_name, password_hash) values (0, '$uuidString', '${request['email']}', null, null, null, '${request['password']}')");
}