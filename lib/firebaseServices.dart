import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/helper.dart';

Logger logger = Logger();
SharedPreferences? prefs;

class FirebaseServices extends ChangeNotifier {
  /// create instance of Firestore
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// create instance of FirebaseMessaging
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  User? currentUser = FirebaseAuth.instance.currentUser;
  final String usersKey = 'user';
  final String alterEgoKey = 'alterEgo';
  final String alterEgoAccessCodeKey = 'alterEgoAccessCodeKey';
  String? _usersID;

  //UserModel? user;


  /// SignUp user
  Future<bool> register(
      BuildContext context, String email, String password, String phoneNumber, String name) async {
    final _user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final _email = email;
    final _password = password;
    final _phoneNumber = phoneNumber;
    final _name = name;
    try {
      final email = _email;
      final secretCode = _password;
      final timeLastUnlocked = FieldValue.serverTimestamp();
      final timeRegistered = FieldValue.serverTimestamp();
      final userType = "REGULAR";
      final name = _name;
      final userId = _user.user?.uid;
      final phoneNumber = _phoneNumber;
      final numberOfOrders = 0;
      final walletBalance = 0;
      FirebaseFirestore.instance
          .collection("users")
          .doc(_user.user!.uid)
          .set({
        "name": name,
        "userId": userId,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "timeLastUnlocked": timeLastUnlocked,
        "timeRegistered": timeRegistered,
        "userType": userType,
        "numberOfOrders": numberOfOrders,
        "walletBalance": walletBalance,
      },
      );
      logger.d('Completely created new ego');
      if (kDebugMode) {
        print('Email: $email');
      }

      setUsersId(_user.user!.uid);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: secretCode)
          .then((value) => {
        setUsersId(value.user!.uid),
      });

      //Fluttertoast.showToast(msg: 'Welcome To Ime Afia');
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //Fluttertoast.showToast(msg:'The password provided is too weak.');
      } else if (e.code.length < 4) {
        //Fluttertoast.showToast(msg:'secret code should be up to 4 digits');
      } else if (e.code == 'email-already-in-use') {
        //Fluttertoast.showToast(msg:'The account already exists for that email.');
      } else if (!isValidEmail(email)) {
        //Fluttertoast.showToast(msg:'email is not invalid');
      }
      logger.e(e);
      //Fluttertoast.showToast(msg: 'error');
      return false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }


  /// Authenticate the user in
  Future<bool> signIn(
      BuildContext context, String email, String password) async {
    final _user;
    try {
      _user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        setUsersId(value.user!.uid),
        //showToast("Showing user UID ${value.user!.uid}")
      });
      //Fluttertoast.showToast(msg: 'You can continue shopping');
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        //Fluttertoast.showToast(msg: 'The ego code is invalid or the ego does not have an ego code.');
      } else if (e.code == 'wrong-email') {
        //Fluttertoast.showToast(msg:'The email is invalid or the user does not have an email.');
      }
      //Fluttertoast.showToast(msg: 'error');
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      prefs = await SharedPreferences.getInstance();
      prefs!.remove(usersKey);
      // redirect to login screen or any other screen as required
      Get.offAllNamed('/bnav');    } catch (e) {
      logger.e(e);
    }
  }



  /// cache user id
  void setUsersId(String id) async {
    //await getUserWithId(id: id);
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(usersKey, id);
    notifyListeners();
  }


  /// get users id
  Future<String> getUsersId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(usersKey) ?? '';
  }



}



