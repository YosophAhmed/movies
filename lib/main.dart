import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';

import 'movies_app.dart';

void main() {
  ServicesLocator().init();
  runApp(
    const MoviesApp(),
  );
}
