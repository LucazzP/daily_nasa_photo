import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class Features {
  static ValueNotifier<Map<String, bool>> _features;

  static const dev = <String, bool>{
    'feature_1': true,
    'feature_2': true,
  };
  static const qa = <String, bool>{
    'feature_1': false,
    'feature_2': true,
  };
  static const prod = <String, bool>{
    'feature_1': true,
    'feature_2': false,
  };

  static Map<String, bool> get devRemote {
    _remoteConfig(dev);
    return _features.value;
  }

  static Map<String, bool> get qaRemote {
    _remoteConfig(qa);
    return _features.value;
  }

  static Map<String, bool> get prodRemote {
    _remoteConfig(prod);
    return _features.value;
  }

  static Future<void> _remoteConfig(Map<String, bool> env) async {
    if (_features != null) return;
    WidgetsFlutterBinding.ensureInitialized();
    _features = ValueNotifier(env);
    // final remoteConfig = await RemoteConfig.instance;
    // remoteConfig.addListener(() {
    //   _features.value = remoteConfig.getAll().map(
    //         (key, value) => MapEntry(key, value.asBool()),
    //       );
    //       print(_features.value);
    // });
    // await remoteConfig.setDefaults(env);
    // await remoteConfig.fetch(expiration: Duration(minutes: 2));
    // await remoteConfig.activateFetched();
  }
}
