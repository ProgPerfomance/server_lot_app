import 'package:mysql_client/mysql_client.dart';
import 'package:uuid/uuid.dart';

class AuthUser {
  static Future<void> registrationUser(request, MySQLConnection sql) async {
    var resul = await sql.execute(
      "SELECT * FROM users",
      {},
    );
    String id = resul.rows.last.assoc()['id'] as String;
    int id_int = int.parse(id);
    Uuid uuid = Uuid();
    String uuidString = uuid.v1();
    await sql.execute(
        "insert into users (id, uuid, email, phone, first_name, last_name, password_hash) values (${id_int + 1}, '$uuidString', '${request['email']}', null, null, null, '${request['password']}')");
  }
  static Future<dynamic> loginUser(request, MySQLConnection sql) async {
    if(request['password'] is String && request['email'] is String) {
      var user = await sql.execute(
        "SELECT * FROM users where email = '${request['email']}', password_hash = '${request['password']}'"
      );
      try {
       var uid = user.rows.first.assoc()['id'];
       return uid;
      } catch (error) {
        return error.toString();
      }
    }
    return 'invalid email or password';
  }
}
