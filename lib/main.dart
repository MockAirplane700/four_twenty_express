import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:four_twenty_express/animated_widgets/custom_animated_checkmark.dart';
import 'package:four_twenty_express/animated_widgets/delivery_tracker.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/objects/product.dart';
import 'package:four_twenty_express/pages/delivery_tracker.dart';
import 'package:four_twenty_express/pages/product_display_flower_etc.dart';
import 'package:four_twenty_express/pages/store_display.dart';
import 'package:four_twenty_express/widgets/custom_checkout_card.dart';
import 'package:four_twenty_express/widgets/custom_product_card.dart';
import 'package:four_twenty_express/widgets/custom_store_card.dart';

import 'objects/store.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51MKPRoHk4u280IZeWqjtdfp2ZnahOADfWDQmeAQ8aF3RmttlzZpfyUGCsvKdg3vC78wOkppVcBsaHU3GoKGdR1Lu00d7F5CYpO';
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String state = '';
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: state.contains('ON') ?
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //  ANIMATED CHECKMARK
              const AnimatedCheckMark(),
              //  DELIVERY TRACKER
               const PackageDeliveryTrackingPage(),
              //  CHECKOUT CARD
              CheckoutTile(
                  title: 'The Green Organic Dutchman | Organic Sugar Bush', thumbnail: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af',
                  total: 44.50, quantity: 2,
                  onPressed: (){}, delete: IconButton(onPressed: () {}, icon: const Icon(Icons.delete, color: Colors.red,)),
                  quantityWidget: Container()
              ),
              //  PRODUCT CARD FLOWER
              CustomProductCard(product: Product(
                  id: '0', name: 'Organic Sugar Bush', type: 'bud',
                  description: 'Organic Sugar Bush is a high potency Sativa that has a notably floral and sweet scent, reminiscent of ripe melon and rosewood.',
                  images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbud-1.png?alt=media&token=633fc5dd-9c11-4b2c-bed4-1a4cced418af'],
                  price: 44.50,
                thc: '33.33%',
                cbd: '> 1%',
                strain: 'Organic Sugar Bush ',
                supplier: 'THE GREEN ORGANIC DUTCHMAN',
                sizes: ['3.5'],
                effects: ['Energetic', 'Happy', 'Creative', 'Focused', 'Inspired'],
                strainType: 'Sativa'
              )),
              //  PRODUCT CARD ACCESSORIES
              CustomProductCard(product: Product(
                  id: '1', name: '420 Science | Rez Block Solution', type: 'accessory',
                  description: 'There’s something about a water pipe coated in resin that just makes us feel dirty. That’s why we change our water every day. But that’s not all. Not by a long shot. We also use RezBlock. Just a few drops help prevent the resin from building up. It keeps our pieces clean, and our hits fresh and delicious.When you add RezBlock to your water, it prevents the resins from sticking to the glass and instead they float in the water allowing you to pour out that gunk along with the ash and other particulates you don\'t want. RezBlock is completely organic, which means you\'ll need to change your water out regularly. With RezBlock and regular water changes, you\'ll see drastically less buildup in your bong.',
                  images: ['https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Faccessory-1.png?alt=media&token=774863c7-d3cf-4a4a-87c8-a40c5a283e67'],
                  price: 2.50,
                  sizes: ['3ml'],
              )),
              //  STORE CARD
              StoresDashboardCard(
                store:Store(
                    id: '0', name: 'Star Cannabis co ',
                    description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
                    images: [
                      'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
                      'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
                      'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
                    ],

                    products: ['0' , '1' , '2'],
                    address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
                    website: 'https://www.starbuds.co/', phone: '4313343047',
                    email: 'sizibamthandazo@yahoo.com', rating: '4.5'
                ) ,
                  banner: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
                  thumbnail: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
                  name: 'Star Buds Cannabis Co', duration: '30 - 45 mins', fee: '5.99',
                  googleRating:'4.2',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreDisplayPage(store: Store(
                      id: '3', name: 'Star Cannabis co ',
                      description: 'STAR BUDS is YOUR friendly neighbourhood cannabis store.     We provide a comfortable setting to learn about and purchase cannabis & accessories. Our carefully curated selection has something for everyone, from the occasional user to the daily consumer.  We are home to a top-notch selection of cannabis flower, plus a wide array of cannabis concentrates, edibles and more!  Check out our product selection in Ontario, Manitoba and Alberta!',
                      images: [
                        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fstar-logo.png?alt=media&token=20ce4ec4-716a-4153-b88b-bef45245c0cc',
                        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2Fbanner-star.png?alt=media&token=70009ab4-24ec-4db5-ad79-6ee09d482d23',
                        'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/four_twenty_express%2F2022-02-12.png?alt=media&token=8515d13d-7316-47f6-9b25-74d5b070f3f5'
                      ],

                      products: ['0' , '1' , '2'],
                      address: ['1566 Pembina Hwy, Winnipeg, MB R3T 2E9'],
                      website: 'https://www.starbuds.co/', phone: '4313343047',
                      email: 'sizibamthandazo@yahoo.com', rating: '4.5'
                  ),)));
                },
              )
            ],
          ),
        ),
      ) :  widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            //  DASHBOARD
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home'
            ),
            //  CART
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart'
            ),
            //  DELIVERY PAGE
            BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining),
                label: 'Tracker'
            ),
            //  BOOKMARKS
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.heart),
                label: 'Favourites'
            ),
            //  SETTINGS
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: iconColor,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
