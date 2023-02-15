import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutForm extends StatefulWidget {


  const CheckoutForm({Key? key,
    }) : super(key: key);

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _nameOnAccountController = TextEditingController();
  TextEditingController _whyRequestController = TextEditingController();
  TextEditingController _value4Controller = TextEditingController();
  TextEditingController _value5Controller = TextEditingController();
  TextEditingController _value6Controller = TextEditingController();
  TextEditingController _value7Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;

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
        child: Container(
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
                        child: Text('hello',
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

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              controller: _accountNumberController,
                              decoration: new InputDecoration(
                                hintText: "enter bank account number",
                                labelText: "Account Number",
                                labelStyle:
                                TextStyle(color: Colors.grey),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.amber)),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.grey)),
                                contentPadding:
                                EdgeInsets.only(right: 15, left: 15),
                              ),
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.lato(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter bank name";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              controller: _bankNameController,
                              decoration: new InputDecoration(
                                hintText: "Bank Of The Rising Sun",
                                labelText: "Bank Name",
                                labelStyle:
                                TextStyle(color: Colors.grey),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.amber)),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.grey)),
                                contentPadding:
                                EdgeInsets.only(right: 15, left: 15),
                              ),
                              keyboardType: TextInputType.text,
                              style: GoogleFonts.lato(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          color: Colors.white,
                          child: TextFormField(
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter bank name";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              controller: _nameOnAccountController,
                              decoration: new InputDecoration(
                                hintText: "Clairechi Naomi Peperempe",
                                labelText: "Name On Account",
                                labelStyle:
                                TextStyle(color: Colors.grey),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.amber)),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
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

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          color: Colors.white,
                          child: TextFormField(
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "What's the need?";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              controller: _whyRequestController,
                              decoration: new InputDecoration(
                                hintText: "I will like to...",
                                labelText: "What will this cash be used for?",
                                labelStyle:
                                TextStyle(color: Colors.grey),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.amber)),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
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
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: Colors.grey.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text('Send',
                            //textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                fontSize: 13.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onContinueToWhatsAppClicked,
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

                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: launchEmailApp,
                    child: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Icon(Icons.email, color:Colors.white, size:30),
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
      ),
    );
  }


  String? getWhatsAppUrl(String payload ){
    return "https://api.whatsapp.com/send?phone=2348188578955&text=" + (payload);
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
      path: 'dearclaireapp@gmail.com',
      query: encodeQueryParameters(
          <String, String>{
            'subject': 'Requesting Alter Ego Mode',
            'body': payload,
          }),
    );

    launchUrl(emailLaunchUri);
  }

  String? getPayload(){
    var userId = 'j';
    var totalLove = 'ho';
    var currentRequest = 'widget.currentWithdrawal.isEmpty ? "null" : widget.currentWithdrawal';
    var withdrawableLoves = 'widget.currentWithdrawable.isEmpty ? "null" : widget.currentWithdrawable';
    var totalWithdrawn = 'widget.totalWithdrawn.isEmpty ? "null" : widget.totalWithdrawn';



    var accountNumber = _accountNumberController.text.isEmpty ? "null" : _accountNumberController.text;
    var bankName = _bankNameController.text.isEmpty ? "null" : _bankNameController.text;
    var whyRequest = _whyRequestController.text.isEmpty ? "null" : _whyRequestController.text;



    return """
      Hi, Admin,
      I'm requesting some cash for the month. These are the details:

      UserId: $userId
      
      Total Love: $totalLove
      
      Current Withdrawable: $withdrawableLoves
      
      Total Withdrawn: $totalWithdrawn
      
      Current Request in Naira: $currentRequest

      Account Number: $accountNumber

      Bank Name: $bankName

      Write A Short Need: $whyRequest

    """.trim();
  }
}

class MultiSwitchOptions extends StatefulWidget {
  const MultiSwitchOptions({Key? key}) : super(key: key);

  @override
  _MultiSwitchOptionsState createState() => _MultiSwitchOptionsState();
}

class _MultiSwitchOptionsState extends State<MultiSwitchOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}