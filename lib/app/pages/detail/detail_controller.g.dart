// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailController on _DetailControllerBase, Store {
  final _$expandedAtom = Atom(name: '_DetailControllerBase.expanded');

  @override
  bool get expanded {
    _$expandedAtom.reportRead();
    return super.expanded;
  }

  @override
  set expanded(bool value) {
    _$expandedAtom.reportWrite(value, super.expanded, () {
      super.expanded = value;
    });
  }

  final _$listaComicsAtom = Atom(name: '_DetailControllerBase.listaComics');

  @override
  ObservableFuture<List<Comic>> get listaComics {
    _$listaComicsAtom.reportRead();
    return super.listaComics;
  }

  @override
  set listaComics(ObservableFuture<List<Comic>> value) {
    _$listaComicsAtom.reportWrite(value, super.listaComics, () {
      super.listaComics = value;
    });
  }

  final _$_DetailControllerBaseActionController =
      ActionController(name: '_DetailControllerBase');

  @override
  dynamic init(Personagem personagem) {
    final _$actionInfo = _$_DetailControllerBaseActionController.startAction(
        name: '_DetailControllerBase.init');
    try {
      return super.init(personagem);
    } finally {
      _$_DetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getComics(int idCharacter) {
    final _$actionInfo = _$_DetailControllerBaseActionController.startAction(
        name: '_DetailControllerBase.getComics');
    try {
      return super.getComics(idCharacter);
    } finally {
      _$_DetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expanded: ${expanded},
listaComics: ${listaComics}
    ''';
  }
}
