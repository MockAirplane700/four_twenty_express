import 'package:flutter/material.dart';
import 'package:four_twenty_express/constants/functions.dart';
import 'package:four_twenty_express/constants/variables.dart';
import 'package:four_twenty_express/logic/checkout_bloc.dart';
import 'package:settings_ui/settings_ui.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _key = GlobalKey<FormState>();
  final _keyEmail = GlobalKey<FormState>();
  final _keyPassword = GlobalKey<FormState>();
  String currentUserName = 'John Doe';
  String currentEmail = 'emailemail@newgatesolutions.ca';
  String password = 'hello world';
  String readingStyle = 'vertical';
  String currentLanguage = 'English';
  bool boolean = true;
  String privacyPolicy = 'https://www.sizibamthandazo.dev';
  String versionNumber = '0.1.0';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(onPressed: () {
            // showSearch(context: context, delegate: MySearchDelegateLikedComics());
          }, icon: const Icon(Icons.search))
        ],
      ),
      backgroundColor: appBackgroundColor,
      body: SettingsList(
        sections: [
          // Authentication section
          SettingsSection(
            tiles: [
              //user name -> change user name
              SettingsTile(
                title: const Text('User Name', style: TextStyle(color: textColor),),
                description: Text(currentUserName, style: const TextStyle(color: textColor),),
                onPressed: (context) {
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('Change User name', style: TextStyle(color: textColor),),
                    content: Form(key: _key,child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: currentUserName,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(height/80),
                                  borderSide: BorderSide(width: height/100)

                              )
                          ),
                          validator: (value){
                            if (value == null ||value.isEmpty ){
                              return 'User name cannot be empty.';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              currentUserName = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // validate and submit form
                                  if (_key.currentState!.validate()){
                                    //todo: add check mark animations
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username has been changed')));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appBackgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                    side: BorderSide(width: height/200, color: iconColor)
                                ),
                                child: const Text('Submit', style: TextStyle(color: textColor),)
                            )
                          ],
                        )
                      ],
                    )),
                  ));
                },
              ),
              //email -> change email
              SettingsTile(
                title: const Text('Email', style: TextStyle(color: textColor),),
                description: Text(currentEmail, style: const TextStyle(color: textColor),),
                onPressed: (context) {
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('Change email', style: TextStyle(color: textColor),),
                    content: Form(key: _keyEmail,child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: currentEmail,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(height/80),
                                  borderSide: BorderSide(width: height/100)

                              )
                          ),
                          validator: (value){
                            if (value == null ||value.isEmpty ){
                              return 'Email name cannot be empty.';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              currentEmail = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // validate and submit form
                                  if (_keyEmail.currentState!.validate()){
                                    //todo: add check mark animations
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email has been changed')));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appBackgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                    side: BorderSide(width: height/200, color: iconColor)
                                ),
                                child: const Text('Submit', style: TextStyle(color: textColor),)
                            )
                          ],
                        )
                      ],
                    )),
                  ));
                },
              ),
              //password -> change password
              SettingsTile(
                title: const Text('Password', style: TextStyle(color: textColor),),
                description: Text( true ? password.replaceAll(RegExp(r"."), "*") : '', style: const TextStyle(color: textColor,),),
                onPressed: (context) {
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('Change your password', style: TextStyle(color: textColor),),
                    content: Form(key: _keyPassword,child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: '*********',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(height/80),
                                  borderSide: BorderSide(width: height/100)

                              )
                          ),
                          validator: (value){
                            if (value == null ||value.isEmpty ){
                              return 'password cannot be empty.';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // validate and submit form
                                  if (_keyPassword.currentState!.validate()){
                                    //todo: add check mark animations
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password has been changed')));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appBackgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                    side: BorderSide(width: height/200, color: iconColor)
                                ),
                                child: const Text('Submit', style: TextStyle(color: textColor),)
                            )
                          ],
                        )
                      ],
                    )),
                  ));
                },
              ),
            ],
            title: const Text('Authentication'),
          ),
          // Customize application
          SettingsSection(
            tiles: [
              // Subscribe
              SettingsTile(
                title: const Text('Subscribe',style: TextStyle(color: textColor),),
                description: const Text('Subscribe CAD\$5.00/month', style: TextStyle(color: textColor),),
                onPressed: (context){
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('Subscribe'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // What does it mean to be subscribed to us.
                        const Text('What does it mean to subscribe to Black Valley comics.',style: TextStyle(color: textColor),),
                        Padding(
                          padding: EdgeInsets.all(height/80),
                          child: const Text('', style: TextStyle(color: textColor),),
                        ),
                        // Subscription price,
                        const Text('\$CAD2.99',style: TextStyle(color: textColor, ),),
                        // Subscribe button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // todo: subscribe via payment gateway
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appBackgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                    side: BorderSide(width: height/200, color: iconColor)
                                ),
                                child: const Text('Subscribe', style:TextStyle(color: textColor),)
                            )
                          ],
                        )
                      ],
                    ),
                  ));
                },
              ),
              // Language
              SettingsTile(
                title: const Text('Language',style: TextStyle(color: textColor),),
                description: Text(currentLanguage, style: const TextStyle(color: textColor),),
                onPressed: (context){
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('Choose language'),
                    content: Column(),
                  ));
                },
              ),
              // Reading style


            ],
            title: const Text('Customize application'),
          ),
          // Standard settings
          SettingsSection(
            tiles: [
              // Privacy policy
              SettingsTile(
                title: const Text('Privacy Policy', style: TextStyle(color: textColor ),),
                description: Text(privacyPolicy, style: const TextStyle(color: textColor),),
                onPressed: (context){
                  launchWebSiteUrl(privacyPolicy);
                },
              ),
              // About
              SettingsTile(
                title: const Text('About', style: TextStyle(color: textColor),),
                description:const Text('About the app', style: TextStyle(color: textColor),),
                onPressed: (context){
                  showDialog(context: context, builder: (context)=> AlertDialog(
                    title: const Text('About the app', style: TextStyle(color: textColor),),
                    content:  Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // What does it mean to be subscribed to us.
                        const Text('About Black Valley Comics',style: TextStyle(color: textColor),),
                        Padding(
                          padding: EdgeInsets.all(height/80),
                          child: const Text('', style: TextStyle(color: textColor),),
                        ),
                        // Subscribe button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  launchWebSiteUrl(appShareUrl);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appBackgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                    side: BorderSide(width: height/200, color: iconColor)
                                ),
                                child: const Text('Visit our website', style:TextStyle(color: textColor),)
                            )
                          ],
                        )
                      ],
                    ),
                  ));
                },
              ),
              // Version
              SettingsTile(
                title: const Text('Version', style: TextStyle(color: textColor),),
                description: Text('Version: $versionNumber', style: const TextStyle(color: textColor),),
              )
            ],
            title: const Text('Other'),
          ),
        ],
      ),
    );
  }
}
