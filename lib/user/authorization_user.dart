import 'package:uuid/uuid.dart';

import '../server_lot_app.dart';

Future<void> registrationUser(request) async {
  Uuid uuid = Uuid();
String uuidString = uuid.v1();
await  sql?.execute("insert into users (id, uuid, email, phone, first_name, last_name, password_hash) values (0, '$uuidString', '${request['email']}', null, null, null, '${request['password']}')");
}