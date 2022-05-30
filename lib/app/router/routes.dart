enum AppRoutes {
  home('/', 'HOME'),
  breed('breed', 'BREED');

  const AppRoutes(this.path, this.routeName);

  final String path;
  final String routeName;
}
