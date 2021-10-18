import 'dart:io';

import 'package:dio/dio.dart';
import 'package:marvel_app/app/data/models/comics.dart';
import 'package:marvel_app/app/data/models/personagem.dart';

class PersonagensRepository {
  final Dio _dio = Dio();
  String url = 'http://gateway.marvel.com/v1/public';

  String timestamp = '1634399170';
  String publicKey = 'f76bd9d02cd3dec4875b64d76b6695af';
  String md5 = '82d79b9a2b84dac4378f6d01f6d041e0';

  List<Personagem> lista = [];

  Future<List<Personagem>> getPersonagens(int offset) async {
    Map<String, dynamic> queryParams = {};
    queryParams['apikey'] = publicKey;
    queryParams['hash'] = md5;
    queryParams['limit'] = 10;
    queryParams['offset'] = offset;

    Response response = await _dio.get(
      '$url/characters?ts=$timestamp',
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      lista.addAll(Personagem.fromJsonList(response.data['data']['results']));
      return lista;
    } else {
      throw HttpException(response.statusMessage.toString());
    }
  }

  Future<List<Comic>> getComicsFromCharacter(int idCharacter) async {
    Map<String, dynamic> queryParams = {};
    queryParams['apikey'] = publicKey;
    queryParams['hash'] = md5;

    Response response = await _dio.get(
      '$url/characters/$idCharacter/comics?ts=$timestamp',
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      return Comic.fromJsonList(response.data['data']['results']);
    } else {
      throw HttpException(response.statusMessage.toString());
    }
  }
}
