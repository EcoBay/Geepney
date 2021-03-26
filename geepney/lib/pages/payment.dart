import 'package:flutter/material.dart';
import 'package:flutter_google_pay/flutter_google_pay.dart';
import 'package:geepney/locations.dart' as locations;

import 'package:geepney/components/appbar.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  BuildContext scaffoldContext;

  @override
  void initState() {
    super.initState();
  }

  _makeStripePayment() async {
    var environment = 'rest'; // or 'production'

    if (!(await FlutterGooglePay.isAvailable(environment))) {
      _showToast(scaffoldContext, 'Google pay not available');
    } else {
      PaymentItem pm = PaymentItem(
          stripeToken: 'pk_test_1IV5H8NyhgGYOeK6vYV3Qw8f',
          stripeVersion: "2018-11-08",
          currencyCode: "php",
          amount: "42.0",
          gateway: 'stripe');

      FlutterGooglePay.makePayment(pm).then((Result result) {
        if (result.status == ResultStatus.SUCCESS) {
          _showToast(scaffoldContext, 'Success');
          Navigator.pushNamed(context, '/disembark');
        }
      }).catchError((dynamic error) {
        _showToast(scaffoldContext, error.toString());
      });
    }
  }

  _makeCustomPayment() async {
    var environment = 'rest'; // or 'production'

    if (!(await FlutterGooglePay.isAvailable(environment))) {
      _showToast(scaffoldContext, 'Google pay not available');
    } else {
      ///docs https://developers.google.com/pay/api/android/guides/tutorial
      PaymentBuilder pb = PaymentBuilder()
        ..addGateway("example")
        ..addTransactionInfo("1.0", "PHP")
        ..addAllowedCardAuthMethods(["PAN_ONLY", "CRYPTOGRAM_3DS"])
        ..addAllowedCardNetworks(
            ["MASTERCARD", "VISA"])
        ..addBillingAddressRequired(true)
        ..addPhoneNumberRequired(true)
        ..addShippingAddressRequired(true)
        ..addShippingSupportedCountries(["US", "GB"])
        ..addMerchantInfo("Example");

      FlutterGooglePay.makeCustomPayment(pb.build()).then((Result result) {
        if (result.status == ResultStatus.SUCCESS) {
          _showToast(scaffoldContext, 'Success');
        } else if (result.error != null) {
          _showToast(context, result.error);
        }
      }).catchError((error) {
        //TODO
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeepneyAppBar("Trip summary"),
      body: Builder(builder: (context) {
        scaffoldContext = context;
        return Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                children : <Widget>[
                  Text("Address 1 - Landmark 3", style : TextStyle(fontSize : 10)), 
                  Text("49.00 Php", style : TextStyle(fontSize : 30)), 
                  Text("XX Km - XX Php/Km", style : TextStyle(fontSize : 8)), 
                ]
              ),
              SizedBox(height : 50),
              Card(
                child : InkWell( child : FlatButton(
                  onPressed: _makeStripePayment,
                  child: Text('Pay'),
                )),
              ),
            ],
          )
        );
      })
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
