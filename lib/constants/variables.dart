import 'package:flutter/material.dart';
import 'package:four_twenty_express/pages/bookmarked_stores.dart';
import 'package:four_twenty_express/pages/checkout.dart';
import 'package:four_twenty_express/pages/dashboard.dart';
import 'package:four_twenty_express/pages/delivery_tracker.dart';
import 'package:four_twenty_express/pages/settings.dart';

///-----------------------------------------------------------------------------
///                        COLORS
/// ----------------------------------------------------------------------------

// APP BAR COLOR
const Color appBarColor = Colors.white;
// APP BACKGROUND COLOR
const Color appBackgroundColor = Colors.white;
// TEXT COLOR
const Color textColor = Colors.black;
// ICON COLOR
const Color iconColor = Colors.lightGreenAccent;
// CARD COLOR
const Color cardColor = Colors.white;
// ICON THEME DATA
const Color iconThemeDataColor = Colors.black;
// DIVIDER COLOR
const Color dividerColor = Colors.black;
// SHADOW COLOR
const Color shadowColor = Colors.black;
// BUTTON COLOR
const Color buttonColor = Colors.green;
// DIALOG BOX COLOR
const Color dialogBoxColor = Colors.white;

///-----------------------------------------------------------------------------
///           STYLING AND FONTS
/// ----------------------------------------------------------------------------
// FONT STYLE OF APPLICATION
// BUTTON TEXT STYLE
const TextStyle buttonTextStyle = TextStyle(color: textColor);
// GENERAL TEXT TEXT STYLE
const TextStyle generalTextStyle = TextStyle(color: textColor);
// TITLE TEXT STYLE
const TextStyle titleTextStyle = TextStyle(color: textColor, fontWeight: FontWeight.bold);
// SUB TITTLE TEXT STYLE
const TextStyle subtitleTextStyle = TextStyle(color: Colors.grey, fontSize: 13);

///-----------------------------------------------------------------------------
///         STRINGS AND PRIMITIVE TYPES
/// ----------------------------------------------------------------------------

// SHARE THIS APP URL
const String appShareUrl = '';
// PRIVACY POLICY
const String privacyPolicyUrl = '';
// HOW THE APP WORKS
const String howTheAppWorks = '';
// REFUND POLICY
const String refundPolicy = '';
// ABOUT THE APP
const String about = '';
// VERSION
const String appVersion = '';
// SUPPORT EMAIL
const String supportEmail = '';
// APP WEBSITE
const String appWebsite = '';
// TIK TOK
const String tiktokUrl = '';
// INSTAGRAM
const String instagramUrl = '';
// TWITTER
const String twitterUrl = '';
// APPLICATION LOGO
const String applicationLogo = '';
// DATABASE URL ACCESS ( TO BE IN ENV )
const String databaseUrl = '';
// EXPLAIN TAX CHARGES
const String taxExplaination = '';
// EXPLAIN DELIVERY CHARGES
const String deliveryExplaination = '';
// EXPLAIN SERVICE FEES
const String serviceFeesExplaination = '';

///-----------------------------------------------------------------------------
///   BOTTOM NAVIGATION BAR WIDGET OPTIONS
///-----------------------------------------------------------------------------
const List<Widget> widgetOptions = [
  //  DASHBOARD HOME
  HomeDashBoard(),
  //  CART
  CheckoutPage(),
  //  DELIVERY PAGE
  DeliveryTrackerPage(),
  //  BOOKMARKS
  BookmarkedStores(),
  //  SETTINGS
  Settings()
];