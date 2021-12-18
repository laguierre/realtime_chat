import 'package:realtime_chat/global/environment.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:realtime_chat/models/usuarios_response.dart';
import 'package:realtime_chat/services/auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp =
          await http.get(Uri.parse('${Environment.apiUrl}/usuarios'), headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? ""
      });
      print(resp.body);
      final usuariosResponse = usuariosResponseFromJson(resp.body);
      return usuariosResponse.usuarios;
    } catch (e) {
      print("Fallo carga de usuarios");
      return [];
    }
  }
}
