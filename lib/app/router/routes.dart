import 'package:doggos/home/home.dart';
import 'package:flutter/material.dart';

enum AppRoutes {
  home('/', 'HOME', HomePage());

  const AppRoutes(this.path, this.routeName, this.view);

  final String path;
  final String routeName;
  final Widget view;
}
