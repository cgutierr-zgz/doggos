enum AppRoutes {
  home('/', 'HOME'),
  breed('breed', 'BREED'),
  checkOut('checkout', 'CHECKOUT');

  const AppRoutes(this.path, this.routeName);

  final String path;
  final String routeName;
}
