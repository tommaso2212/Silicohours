import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Environment { development, staging, production }

final environmentProvider = Provider<Environment>((ref) {
  const env = String.fromEnvironment('FLUTTER_ENV', defaultValue: 'development');
  return Environment.values.byName(env);
});

final apiBaseUrlProvider = Provider<String>((ref) {
  return const String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://localhost:8000',
  );
});
