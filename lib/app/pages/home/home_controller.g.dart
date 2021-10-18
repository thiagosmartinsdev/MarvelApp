// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaPersonAtom = Atom(name: '_HomeControllerBase.listaPerson');

  @override
  ObservableFuture<List<Personagem>> get listaPerson {
    _$listaPersonAtom.reportRead();
    return super.listaPerson;
  }

  @override
  set listaPerson(ObservableFuture<List<Personagem>> value) {
    _$listaPersonAtom.reportWrite(value, super.listaPerson, () {
      super.listaPerson = value;
    });
  }

  final _$updateImageAtom = Atom(name: '_HomeControllerBase.updateImage');

  @override
  bool get updateImage {
    _$updateImageAtom.reportRead();
    return super.updateImage;
  }

  @override
  set updateImage(bool value) {
    _$updateImageAtom.reportWrite(value, super.updateImage, () {
      super.updateImage = value;
    });
  }

  final _$widthContainerAtom = Atom(name: '_HomeControllerBase.widthContainer');

  @override
  double get widthContainer {
    _$widthContainerAtom.reportRead();
    return super.widthContainer;
  }

  @override
  set widthContainer(double value) {
    _$widthContainerAtom.reportWrite(value, super.widthContainer, () {
      super.widthContainer = value;
    });
  }

  final _$hasMoreAtom = Atom(name: '_HomeControllerBase.hasMore');

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  final _$defaultCharactersPerPageAtom =
      Atom(name: '_HomeControllerBase.defaultCharactersPerPage');

  @override
  int get defaultCharactersPerPage {
    _$defaultCharactersPerPageAtom.reportRead();
    return super.defaultCharactersPerPage;
  }

  @override
  set defaultCharactersPerPage(int value) {
    _$defaultCharactersPerPageAtom
        .reportWrite(value, super.defaultCharactersPerPage, () {
      super.defaultCharactersPerPage = value;
    });
  }

  final _$nextPageThresholdAtom =
      Atom(name: '_HomeControllerBase.nextPageThreshold');

  @override
  int get nextPageThreshold {
    _$nextPageThresholdAtom.reportRead();
    return super.nextPageThreshold;
  }

  @override
  set nextPageThreshold(int value) {
    _$nextPageThresholdAtom.reportWrite(value, super.nextPageThreshold, () {
      super.nextPageThreshold = value;
    });
  }

  final _$offsetAtom = Atom(name: '_HomeControllerBase.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$getPersonsAsyncAction = AsyncAction('_HomeControllerBase.getPersons');

  @override
  Future<dynamic> getPersons() {
    return _$getPersonsAsyncAction.run(() => super.getPersons());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeContainer(BuildContext context) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeContainer');
    try {
      return super.changeContainer(context);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaPerson: ${listaPerson},
updateImage: ${updateImage},
widthContainer: ${widthContainer},
hasMore: ${hasMore},
defaultCharactersPerPage: ${defaultCharactersPerPage},
nextPageThreshold: ${nextPageThreshold},
offset: ${offset}
    ''';
  }
}
