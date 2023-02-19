import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutForm extends StatefulWidget {
  final String orderNumber;

   const CheckoutForm({Key? key, required this.orderNumber,
    }) : super(key: key);

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();
  final TextEditingController _deliveryAddress = TextEditingController();
  final TextEditingController _anyMoreInfo = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: Text('Checkout Form',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: GoogleFonts.lato(
                fontSize: 26.0,
                color: Colors.amber,
                fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

                Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text('Complete Your Order for orderId ${widget.orderNumber}',
                          //textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 13.0,
                              color: Colors.black12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Your Name";
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: _customerName,
                            decoration:  const InputDecoration(
                              hintText: 'Mr Chike Uba',
                              labelText: "Your Name Please",
                              labelStyle:
                              TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey)),
                              contentPadding:
                              EdgeInsets.only(right: 15, left: 15),
                            ),
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Phone Number";
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: _customerPhone,
                            decoration: const InputDecoration(
                              hintText: "+2348068597140",
                              labelText: "Phone Number",
                              labelStyle:
                              TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey)),
                              contentPadding: EdgeInsets.only(right: 15, left: 15),
                            ),
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        color: Colors.white,
                        child: TextFormField(
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Complete Delivery Address";
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: _deliveryAddress,
                            decoration: const InputDecoration(
                              hintText: "No. 1 St Peter's Road, Off Old Onitsha Road, Abubor, Nnewichi, Nnewi.",
                              labelText: "Full Delivery Address",
                              labelStyle:
                              TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey)),
                              contentPadding:
                              EdgeInsets.only(right: 15, left: 15),
                            ),
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        color: Colors.white,
                        child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: _anyMoreInfo,
                            decoration: const InputDecoration(
                              hintText: "I will like you guys to...",
                              labelText: "Any More Info?",
                              labelStyle:
                              TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey)),
                              contentPadding:
                              EdgeInsets.only(right: 15, left: 15),
                            ),
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.lato(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text('Choose a method below to confirm your order and start a conversation with us to track your oder.',
                          //textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await updateOrderOnFirestore();
                    onContinueToWhatsAppClicked();
                  },
                  child: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Image.asset('assets/images/ic_whatsapp_white.png',
                            height: 25, width: 25,),
                          Padding(
                            padding: const EdgeInsets.only(right: 75.0),
                            child: Text("CONTINUE VIA WHATSAPP",
                                //textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8,),
                GestureDetector(
                  onTap: () async {
                    await updateOrderOnFirestore();
                    launchEmailApp();
                  },
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Icon(Icons.email, color:Colors.white, size:30),
                          Padding(
                            padding: const EdgeInsets.only(right: 75.0),
                            child: Text("CONTINUE VIA EMAIL",
                                //textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  String? getWhatsAppUrl(String payload ){
    return "https://api.whatsapp.com/send?phone=2348068597140&text=" + (payload);
  }

  onContinueToWhatsAppClicked() {
    var whatsAppUrl = getWhatsAppUrl(getPayload() ?? "");
    launch(whatsAppUrl!);
  }

  launchEmailApp() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final String payload = getPayload().toString();
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'nkwonnewiapp@gmail.com',
      query: encodeQueryParameters(
          <String, String>{
            'subject': 'Please Confirm My Order',
            'body': payload,
          }),
    );

    launchUrl(emailLaunchUri);
  }

  String? getPayload(){
    final currentUser = FirebaseAuth.instance.currentUser;
    var userId = currentUser?.uid;
    var orderNumber = widget.orderNumber;
    var customerName = _customerName.text.isEmpty ? "null" : _customerName.text;
    var customerPhone = _customerPhone.text.isEmpty ? "null" : _customerPhone.text;
    var deliveryAddress = _deliveryAddress.text.isEmpty ? "null" : _deliveryAddress.text;
    var anyMoreInfo = _anyMoreInfo.text.isEmpty ? "null" : _anyMoreInfo.text;



    return """
      Hi, Admin,
      I'm requesting some cash for the month. These are the details:

      UserId: $userId
      
      My Order Number Is: $orderNumber
      
      My Name Is: $customerName
      
      My Phone Number Is: $customerPhone
      
      My Delivery Address Is: $deliveryAddress

      More Info For This Order Is: $anyMoreInfo

    """.trim();
  }


  Future<void> updateOrderOnFirestore() async {
    final CollectionReference cartsCollection = FirebaseFirestore.instance.collection('carts');
    final currentUser = FirebaseAuth.instance.currentUser;
    final orderNumber = widget.orderNumber.toString();

    try {
      await cartsCollection.doc(orderNumber).set({
        'customerName': _customerName,
        'customerPhone': _customerPhone,
        'deliveryAddress': _deliveryAddress,
        'statusOfOrder': 'confirmed',
        'anyMoreInfo': _anyMoreInfo,
      }, SetOptions(merge: true));
    } catch (error) {
      if (kDebugMode) {
        print('Error updating document: $error');
      }
    }
  }

}