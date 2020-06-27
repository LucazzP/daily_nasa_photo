import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_widget/mobx_widget.dart' as mobx;

class ObserverFuture<T> extends StatelessWidget {
  /// If [fetchData] is filled, it will be called just once on initState.
  final VoidCallback fetchData;
  final ObservableFuture<T> Function() observableFuture;
  final Widget Function(BuildContext context, Exception error) onError;
  final Widget Function(BuildContext context) onPending;
  final Widget Function(BuildContext context) onUnstarted;
  final Widget Function(BuildContext context) onNull;
  final int retry;
  final bool autoInitialize;

  /// the [data] property has the value of ObservableFuture, and it may be null eventually.
  /// You can handle null value on [onData] callback or just enter a [onNull] callback to handle null values separately.
  /// Note, if you set a [onNull] callback, the [onData] will not be triggered if value == null.
  final Widget Function(BuildContext context, T data) onData;

  /// Show CircularProgressIndicator while status == pending
  final bool showDefaultProgressInWidget;

  /// Show CircularProgressIndicator over the entire app and lock taps on screen, while status == pending
  final bool showDefaultProgressInOverlay;

  /// Overlay [onPending] circular progress indicator color (if showDefaultProgressInOverlay is enabled)
  final Color progressOverlayColor;

  /// Overlay [onPending] Background color (if showDefaultProgressInOverlay is enabled)
  final Color progressOverlayBgColor;

  /// Required to inform [showDefaultProgressInOverlay = true] in order to show that widget on [onPending] event
  /// This widget will be shown over the entire screen
  final Widget overlayWidget;

  /// Required to inform [fetchData] in order to show that button on error events
  final String reloadButtonText;

  const ObserverFuture({
    Key key,
    @required this.observableFuture,
    @required this.onData,
    this.onNull,
    this.fetchData,
    this.onPending,
    this.onError,
    this.onUnstarted,
    this.showDefaultProgressInOverlay = false,
    this.showDefaultProgressInWidget = false,
    this.progressOverlayColor,
    this.reloadButtonText,
    this.progressOverlayBgColor,
    this.overlayWidget,
    this.retry,
    this.autoInitialize = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mobx.ObserverFuture<T, Exception>(
      fetchData: fetchData,
      observableFuture: observableFuture,
      onError: onError,
      onPending: onPending ??
          (context) => Center(
                child: CircularProgressIndicator(),
              ),
      onUnstarted: onUnstarted,
      onNull: onNull,
      retry: retry,
      autoInitialize: autoInitialize,
      onData: onData,
      showDefaultProgressInWidget: showDefaultProgressInWidget,
      showDefaultProgressInOverlay: showDefaultProgressInOverlay,
      progressOverlayColor: progressOverlayColor,
      progressOverlayBgColor: progressOverlayBgColor,
      overlayWidget: overlayWidget,
      reloadButtonText: reloadButtonText,
    );
  }
}
