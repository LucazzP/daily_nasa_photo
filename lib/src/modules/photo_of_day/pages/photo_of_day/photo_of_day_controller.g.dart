// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_of_day_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotoOfDayController on _PhotoOfDayControllerBase, Store {
  Computed<Resource<List<PhotoModel>>> _$imagesListComputed;

  @override
  Resource<List<PhotoModel>> get imagesList => (_$imagesListComputed ??=
          Computed<Resource<List<PhotoModel>>>(() => super.imagesList,
              name: '_PhotoOfDayControllerBase.imagesList'))
      .value;

  final _$valueSearchAtom = Atom(name: '_PhotoOfDayControllerBase.valueSearch');

  @override
  String get valueSearch {
    _$valueSearchAtom.reportRead();
    return super.valueSearch;
  }

  @override
  set valueSearch(String value) {
    _$valueSearchAtom.reportWrite(value, super.valueSearch, () {
      super.valueSearch = value;
    });
  }

  final _$_PhotoOfDayControllerBaseActionController =
      ActionController(name: '_PhotoOfDayControllerBase');

  @override
  void search(String value) {
    final _$actionInfo = _$_PhotoOfDayControllerBaseActionController
        .startAction(name: '_PhotoOfDayControllerBase.search');
    try {
      return super.search(value);
    } finally {
      _$_PhotoOfDayControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueSearch: ${valueSearch},
imagesList: ${imagesList}
    ''';
  }
}
