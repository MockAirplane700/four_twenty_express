import 'package:url_launcher/url_launcher.dart';

///-----------------------------------------------------------------------------
///                 URL LAUNCHER - FUNCTIONS
///----------------------------------------------------------------------------

// OPEN URL LINK IN BROWSER
Future<void> launchWebSiteUrl(String url) async {

  if (!await launchUrl(Uri.parse(url))){
    throw 'Could not launch url $url';
  }
}//end method
// OPEN NATIVE APP FOR EMAIL
void launchEmailIntent(String mailto , String subject) {
  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mailto,
      query: encodeQueryParameters(<String, String>{
        'subject' : subject
      })

  );

  launchUrl(emailLaunchUri);
}//end method
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
// OPEN PHONE DIALER


///-----------------------------------------------------------------------------
///     STRING PROCESSING
///-----------------------------------------------------------------------------

List<String> getImages(String string) {
  List<String> images = string.split('[');
  List<String> unwantedString = images.last.split(']');
  images.remove('');
  images.addAll(unwantedString[0].split(','));
  images.removeAt(0);
  return images;
}





