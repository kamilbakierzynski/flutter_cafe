class MenuItem {
  final String category;
  final String name;
  final String description;
  final String menuDescription;
  final List<dynamic> price;
  final List<dynamic> size;
  final String imgUrl;
  final bool featured;

  MenuItem({
    this.category,
    this.name,
    this.description,
    this.menuDescription,
    this.price,
    this.size,
    this.imgUrl,
    this.featured,
  });
}

List <MenuItem> kawa = [
  MenuItem(
      name: 'Latte', description: 'Pełny szot espresso do którego powoli dolewamy podgrzane pleko', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      name: 'Mokka', description: 'Nasza pełna smaku latte z dodatkiem mlecznej czekolady', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      name: 'Flat White', description: 'Pełny szot espresso zalany aksamitnie spienionym mlekiem', price: [16, 20], imgUrl: 'assets/images/coffee_cup.png', featured: false),
];

List <MenuItem> ciasto = [
  MenuItem(
      category: 'ciasto', name: 'Sernik', description: 'Pyszny domowy sernik podany z gorącymi malinami', price: [11], imgUrl: 'assets/images/cake.png', featured: false),
  MenuItem(
      category: 'ciasto', name: 'Szarlotka', description: 'Kurche ciasto z dużą porcją jabłek', price: [12], imgUrl: 'assets/images/cake.png', featured: false),
  MenuItem(
      category: 'ciasto', name: 'Brownie', description: 'Amerykański klasyk z ciemnej czekolady', price: [16], imgUrl: 'assets/images/cake.png', featured: false),
];

List <MenuItem> kanapki = [
  MenuItem(
      category: 'kanapki', name: 'Szynka', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [12], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Ser', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [14], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Jajko', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [14], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Vege', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [16], imgUrl: 'assets/images/sandwich.png', featured: false),
];

List <MenuItem> klasyka = [
  MenuItem(
      category: 'klasyka', name: 'Espresso', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [4.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Espresso Podwójne', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [6.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Americano', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [5.9, 7.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Cappucino', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [8.9, 10.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Latte', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [8.9, 10.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Mokka', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Flat White', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Kawa po Wiedeńsku', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [9.9, 11.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
];

List <MenuItem> firmowe = [
  MenuItem(
      category: 'firmowe', name: 'Rafaello', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Salty Coffee', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [9.9, 11.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Marshmallow Coffee', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [9.9, 11.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Raf Coffee', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Hilton', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Melon Honey', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Bon-Bon', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [9.9, 11.9], imgUrl: 'assets/images/coffee_cup.png', featured: false),
];

List<MenuItem> dane = [
  MenuItem(
      category: 'firmowe', name: 'Rafaello', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Salty Coffee', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [9.9, 11.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Marshmallow Coffee', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [9.9, 11.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Raf Coffee', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Hilton', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Melon Honey', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'firmowe', name: 'Bon-Bon', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [9.9, 11.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Espresso', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [4.9], size: [40], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Espresso Podwójne', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [6.9], size: [80], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Americano', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', price: [5.9, 7.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Cappucino', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [8.9, 10.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Latte', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [8.9, 10.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Mokka', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Flat White', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [10.9, 12.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'klasyka', name: 'Kawa po Wiedeńsku', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [9.9, 11.9], size: [330, 440], imgUrl: 'assets/images/coffee_cup.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Szynka', description: 'Kanapka z szynką, sałatą, ogórkiem oraz sosem aioli', price: [12], size: [], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Ser', description: 'Kanapka z serem, pomidorem, sałatą oraz masłem', price: [14], size: [], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Jajko', description: 'Kanapka z wiejskim jajkiem na twardo z dodatekiem sałaty i majonezu', size: [], price: [14], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'kanapki', name: 'Vege', description: 'Vege opcja z wegańskim warzywnym pasztetem', price: [16], size: [], imgUrl: 'assets/images/sandwich.png', featured: false),
  MenuItem(
      category: 'ciasto', name: 'Sernik', description: 'Pyszny domowy sernik podany z gorącymi malinami', price: [11], size: [], imgUrl: 'assets/images/cake.png', featured: false),
  MenuItem(
      category: 'ciasto', name: 'Szarlotka', description: 'Kurche ciasto z dużą porcją jabłek', price: [12], size: [], imgUrl: 'assets/images/cake.png', featured: false),
  MenuItem(
      category: 'ciasto', name: 'Brownie', description: 'Amerykański klasyk z ciemnej czekolady', price: [16], size: [], imgUrl: 'assets/images/cake.png', featured: false),
];
