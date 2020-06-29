// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_of_day_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotoOfDayStore on _PhotoOfDayStoreBase, Store {
  final _$imagesListAtom = Atom(name: '_PhotoOfDayStoreBase.imagesList');

  @override
  Resource<List<PhotoModel>> get imagesList {
    _$imagesListAtom.reportRead();
    return super.imagesList;
  }

  @override
  set imagesList(Resource<List<PhotoModel>> value) {
    _$imagesListAtom.reportWrite(value, super.imagesList, () {
      super.imagesList = value;
    });
  }

  final _$getPhotosAsyncAction = AsyncAction('_PhotoOfDayStoreBase.getPhotos');

  @override
  Future<void> getPhotos() {
    return _$getPhotosAsyncAction.run(() => super.getPhotos());
  }

  final _$getPhotosNextPageAsyncAction =
      AsyncAction('_PhotoOfDayStoreBase.getPhotosNextPage');

  @override
  Future<void> getPhotosNextPage() {
    return _$getPhotosNextPageAsyncAction.run(() => super.getPhotosNextPage());
  }

  @override
  String toString() {
    return '''
imagesList: ${imagesList}
    ''';
  }
}
