import 'package:flutter/material.dart';
import 'package:realtime_chat/global/environment.dart';
import 'package:realtime_chat/models/mensajes_response.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:realtime_chat/services/auth_service.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final resp = await http
        .get(Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId'), headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken()?? ""
    });
    
    final mensajesResp = mensajesResponseFromJson(resp.body);
    return mensajesResp.mensajes;
  }
}
