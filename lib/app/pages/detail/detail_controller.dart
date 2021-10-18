import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/data/models/comics.dart';
import 'package:marvel_app/app/data/models/personagem.dart';
import 'package:marvel_app/app/data/repository/personagens_repository.dart';
import 'package:mobx/mobx.dart';
part 'detail_controller.g.dart';

class DetailController = _DetailControllerBase with _$DetailController;

abstract class _DetailControllerBase with Store {
  final api = Modular.get<PersonagensRepository>();

  @observable
  bool expanded = false;

  static ObservableFuture<List<Comic>> emptyResp = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Comic>> listaComics = emptyResp;

  @action
  init(Personagem personagem) {
    getComics(personagem.id);
  }

  @action
  getComics(int idCharacter) =>
      listaComics = ObservableFuture(api.getComicsFromCharacter(idCharacter));
}
