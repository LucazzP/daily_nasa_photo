import 'package:mobx/mobx.dart';

extension ObservableFutureExtension<T> on ObservableFuture<T> {
  ObservableFuture<E> map<E>(
          Future<E> Function(ObservableFuture<T> data) transform) =>
      transform(this).asObservable();
}

extension FutureExtension<T> on Future<T> {
  Future<E> map<E>(Future<E> Function(Future<T> data) transform) =>
      transform(this);
}
