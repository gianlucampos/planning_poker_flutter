import 'package:dio/dio.dart';
import 'package:planning_poker_flutter/models/player_model.dart';

class PlayerRepository {
  final Dio _dio;
  final String _url_base = 'http://localhost:8080/v1/api/players';

  PlayerRepository(this._dio);

  Future<List<PlayerModel>> listPlayers() async {
    final response = await _dio.get(_url_base);
    var players = response.data.map((e) => PlayerModel.fromMap(e));
    return List<PlayerModel>.from(players);
  }
}
