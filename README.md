
# Mobile App for Cafe
This project is a fully working solution for small cafes. It was made from scratch during my learning process of Flutter. The design is by [Polina Todorova](https://dribbble.com/tpdesigned) for [StanVision](https://dribbble.com/stanvision) and was uploaded to [Dribbble.com](https://dribbble.com). I don't own the design. The app can be used to let the users order and collect items on site, collect points and use them for free coffees etc.

## Features

 - **Firebase Database and Authentication**
	*Data is stored in the cloud and dynamically updated. You can disable the item and make it 'out of stock' or label it 'NEW'. Every item can be displayed in a special category 'Featured for today'. Customers can register in the app to collect points and order goods. To view the menu you don't have to have an account.*
	
- **Points**
	*Users can collect points for buying something in the Cafe. You can add points using special Admin App by scanning the generated QR code.*
	
- **Orders**
	*Users can add items from the list to cart and then pay by cash (when collecting), or by points collected earlier. Orders are saved on the server side for history preview. You can collect the order by showing the special QR code generated for this order.*
	
- **Notifications**
	*Notifications can be displayed when the order status changes.*

## Used technologies

 - Firebase Database
 - Firebase Authentication
 - Firebase Cloud Messaging
 - Flutter Provider (for operating the cart)
 - Streams
 - Forms
 - Animations
 - Welcome Screen
 - Flutter Slivers (lists, appbars)
- CustomPainter

## Dependencies
- [Provider](https://pub.dev/packages/provider)
- [Hidden Drawer Menu](https://pub.dev/packages/hidden_drawer_menu) (customised for special needs) - for menu navigation
- [Flutter Spinkit](https://pub.dev/packages/flutter_spinkit) - for loading animations
- [Flare Flutter](https://pub.dev/packages/flare_flutter) with [Succes Check](https://rive.app/a/pollux/files/flare/success-check/preview) and [Confetti Boom](https://rive.app/a/zapdeathdoll/files/flare/confetti-boom/preview) - for animation when points are added
- [QR Flutter](https://pub.dev/packages/qr_flutter) - for generating QR codes
- [Auto Size Text](https://pub.dev/packages/auto_size_text) - to dynamically change font size
- [Slimy Card](https://pub.dev/packages/slimy_card)
- [Dropdown form field](https://pub.dev/packages/dropdown_formfield)
- [Short readable id](https://pub.dev/packages/short_readable_id)
- [Toast](https://pub.dev/packages/toast)
plus all the Firebase Plugins.

## Screenshots
![Screenshots](https://i.imgur.com/Y1Ck65S.png)
