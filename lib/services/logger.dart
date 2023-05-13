import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      if (newValue is StateController<dynamic>) {
        print('''
        ======
          "provider": "${provider.name ?? provider.runtimeType}",
          "newValue": "${newValue.state}"
        ======''');
      }
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('''
        ======
          "provider": "${provider.name ?? provider.runtimeType}",
        ======''');
    }
    super.didDisposeProvider(provider, container);
  }
}
