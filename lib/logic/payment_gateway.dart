import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:http/http.dart' as http;

class PaymentGateway {
  static Future<void> makePayment(String total) async {
    try {
      // Recommended we do this on the server
      var paymentIntent = await createPaymentIntent(total, 'CAD');

      // Initialize the payment sheet
      await stripe.Stripe.instance.initPaymentSheet(
        paymentSheetParameters: stripe.SetupPaymentSheetParameters(
          // we get this from the payment intent
            paymentIntentClientSecret: paymentIntent['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'Testing Merchant sizibamthandazo'
        ),
      ).then((value) {});
      // display payment sheet
      displayPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }// end make payment

  static displayPaymentSheet() async {
    try {

      await stripe.Stripe.instance.presentPaymentSheet().then((value) {
        //todo: confirm completion of transaction
      }).onError((error, stackTrace) {
        throw Exception(error.toString());
      });
    } on stripe.StripeException catch (error) {
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children:  [
               const  Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text('Payment failed $error')
              ],
            )
          ],
        ),
      );
    }catch (error) {
      throw Exception(error.toString());
    }
  }//end display payment sheet

  static createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String,dynamic> body = {
        'amount' : calculateAmount(amount),
        'currency':currency,
      };

      // Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body);
    }catch (error) {
      throw Exception(error.toString());
    }//end try-catch
  }//end create payment intent

  static calculateAmount(String amount) {
    double total = double.parse(amount);
    String string = total.toString();
    List substring = string.split('.');
    String result = '${substring[0]}${substring[1]}';
    final calculatedAmount = (int.parse(result));
    return calculatedAmount.toString();
  }//end calculate amount
}