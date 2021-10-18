import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/data/models/personagem.dart';
import 'package:marvel_app/app/repositories/personagens_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<PersonagensRepository>();

  static ObservableFuture<List<Personagem>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Personagem>> listaPerson = emptyResponse;

  @observable
  late bool updateImage = false;

  @observable
  double widthContainer = 0.0;

  @observable
  bool hasMore = true;

  @observable
  int defaultCharactersPerPage = 10;

  @observable
  int nextPageThreshold = 4;

  @observable
  int offset = 0;

  @action
  changeContainer(BuildContext context) {
    widthContainer = MediaQuery.of(context).size.width;
  }

  @action
  Future getPersons() async {
    
      listaPerson = ObservableFuture(api.getPersonagens(offset)).then(
        (value) {
          hasMore = value.length == defaultCharactersPerPage;
          offset = offset + 10;
          return value;
        },
      );
  }
}
