import 'package:flutter/material.dart';
import 'package:flutter_paypal_easy_checkout/flutter_paypal_checkout.dart';

class PayPalPaymentScreen extends StatelessWidget {
  final String clientId = "YOUR_PAYPAL_CLIENT_ID";
  final String secret = "YOUR_PAYPAL_SECRET";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PayPal Checkout")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the PayPal checkout screen
            Navigator.of(context).push(
MaterialPageRoute(
builder: (BuildContext context) => PaypalEasyCheckout(
sandboxMode: true,
clientId: "AXWqrt9x2EHA__o7q9ofO8pUL5cFmwTEglP9NRs7ahveJPfSSCHhWWZjLYw2uWnXNXBk9qyOKUym3gvI",
secretKey: "EPMf97CUv-HM5Qgjm5DvpqD8Pk1gMGNCFFDXHhEtuw0bcjIWquT6oI2-aXMgYH1hkpSdfJC21gIRFDb3",
returnURL: "https://samplesite.com/return",
cancelURL: "https://samplesite.com/cancel",
transactions: [
{
"amount": {
"total": "100.99",
"currency": "USD",
"details": {
"subtotal": "100.99",
"shipping": '0',
"shipping_discount": 0
}
},
"description": "Purchase For something",
"payment_options": {
  "allowed_payment_method":
      "INSTANT_FUNDING_SOURCE"
},
"item_list": {
"items": [
{
"name": "Product name",
"quantity": 1,
"price": "100.99",
"currency": "USD",
}
],
}
}
],
note: "Contact us for any questions on your order.",
onSuccess: (Map params) async {
print(params);
},
onError: (error) {
print(error);
},
onCancel: (params) {
print(params);
}),
),
);
          },
          child: Text("Proceed to PayPal"),
        ),
      ),
    );
  }
}
