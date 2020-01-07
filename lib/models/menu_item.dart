class MenuItem {
  final String name;
  final String description;
  final List<double> price;
  final String imgUrl;

  MenuItem({
    this.name,
    this.description,
    this.price,
    this.imgUrl,
  });
}

List <MenuItem> klasyka = [
  MenuItem(
      name: 'Latte', description: 'Pełny szot espresso do którego powoli dolewamy podgrzane pleko', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Mokka', description: 'Nasza pełna smaku latte z dodatkiem mlecznej czekolady', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Flat White', description: 'Pełny szot espresso zalany aksamitnie spienionym mlekiem', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
];

List <MenuItem> firmowe = [
  MenuItem(
      name: 'Rafaello', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Salty Coffee', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Marshmallow\nCoffee', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Raf Coffee', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Hilton', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Melon Honey', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
  MenuItem(
      name: 'Bon-Bon', description: 'kawa jak kawa', price: [16, 20], imgUrl: 'assets/images/coffee.jpg'),
];