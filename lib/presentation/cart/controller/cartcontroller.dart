

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_easy_checkout/flutter_paypal_checkout.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';

import 'package:training/presentation/cart/cartdata.dart';
import 'package:training/presentation/cart/mycrt.dart';
import 'package:training/presentation/cart/success.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/stripe_payment/payment_manager.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_easy_checkout/flutter_paypal_checkout.dart';
import 'package:training/core/app_export.dart';
import 'package:training/core/network/handlingdata.dart';
import 'package:training/core/network/services.dart';
import 'package:get/get.dart';

import 'package:training/presentation/cart/cartdata.dart';
import 'package:training/presentation/cart/mycrt.dart';
import 'package:training/presentation/cart/success.dart';
import 'package:training/presentation/home_page/models/homedata.dart';
import 'package:training/presentation/signup/models/statusrequest.dart';
import 'package:training/stripe_payment/payment_manager.dart';

class Cartcontroller extends GetxController {
  RxDouble total = 0.0.obs;
  var itemToRemove; // Variable to store item to be removed
  cartdata cart_data = cartdata(Get.find());
  late StatusRequest statusRequest;
  Homedata homedata = Homedata(Get.find());
  
  List<Mycrt> data = []; // Cart items
  Myservices myservices = Get.find();

  // Add item to cart
  add(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cart_data.addcart(myservices.sharedPreferences.getString("id")!, itemId);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      Get.rawSnackbar(title: "تم", message: "Item added to cart");
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // Remove an item from cart
  remove(String cartItemId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cart_data.removecart(myservices.sharedPreferences.getString("id")!, cartItemId);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      data.removeWhere((item) => item.cartItem == cartItemId);
      calculateTotal(); // Recalculate total after item removal
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // Load all items in the cart
  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cart_data.getview(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
    // data.clear();
      List responseData = response['data'];
      data.addAll(responseData.map((e) => Mycrt.fromJson(e)));
      calculateTotal(); // Calculate total for displayed items
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // Calculate total price of items in the cart
  void calculateTotal() {
    total.value = data.fold(0.0, (sum, item) => sum + (double.tryParse(item.price ?? '0') ?? 0.0));
  }

  // Stripe payment handler
  void payNow() {
    int amount = total.toInt();
    PaymentManager.makePayment(amount, "USD");
    clearCart();
   // Get.back();
    update();
  }

  // Clear all items in the cart after payment
  clearCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cart_data.gedelall(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      data.clear();
      //Get.to(SuccessPage());
      calculateTotal();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }

  // PayPal payment handler
  void payWithPaypal(context) {
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
                "total": total.value.toStringAsFixed(2),
                "currency": "USD",
                "details": {"subtotal": total.value.toStringAsFixed(2), "shipping": '0', "shipping_discount": '0'}
              },
              "description": "Purchase For something",
              "item_list": {
                "items": [
                  {"name": "Product name", "quantity": 1, "price": total.value.toStringAsFixed(2), "currency": "USD"}
                ]
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            clearCart();
            update();
          },
          onError: (error) => print("Error: $error"),
          onCancel: (params) => print("Canceled: $params"),
        ),
      ),
    );
  }
}
