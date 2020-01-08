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

List <MenuItem> kawa = [
  MenuItem(
      name: 'Latte', description: 'Pełny szot espresso do którego powoli dolewamy podgrzane pleko', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png'),
  MenuItem(
      name: 'Mokka', description: 'Nasza pełna smaku latte z dodatkiem mlecznej czekolady', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png'),
  MenuItem(
      name: 'Flat White', description: 'Pełny szot espresso zalany aksamitnie spienionym mlekiem', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png'),
];

List <MenuItem> ciasto = [
  MenuItem(
      name: 'Sernik', description: 'Pyszny domowy sernik podany z gorącymi malinami', price: [11], imgUrl: 'assets/images/cake.png'),
  MenuItem(
      name: 'Szarlotka', description: 'Kurche ciasto z dużą porcją jabłek', price: [12], imgUrl: 'assets/images/cake.png'),
  MenuItem(
      name: 'Brownie', description: 'Amerykański klasyk z ciemnej czekolady', price: [16], imgUrl: 'assets/images/cake.png'),
];

List <MenuItem> kanapki = [
  MenuItem(
      name: 'Szynka', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [12], imgUrl: 'assets/images/sandwich.png'),
  MenuItem(
      name: 'Ser', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [14], imgUrl: 'assets/images/sandwich.png'),
  MenuItem(
      name: 'Jajko', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [14], imgUrl: 'assets/images/sandwich.png'),
  MenuItem(
      name: 'Vege', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [16], imgUrl: 'assets/images/sandwich.png'),
];