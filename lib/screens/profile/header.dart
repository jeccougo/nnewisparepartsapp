import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back),
              SizedBox(width: 15),
              Expanded(
                child: Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              // IconButton(
              //   iconSize: 28,
              //   icon: Image.asset('assets/icons/buttomnav/light/more_circle@2x.png', scale: 2),
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Stack(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/icons/me.png'),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  child: Image.asset('assets/icons/profile/edit_square@2x.png', scale: 2),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
         Text('Email: ${_user.email}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const SizedBox(height: 8),
        Text('User ID: ${_user.uid}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          color: const Color(0xFFEEEEEE),
          height: 1,
          padding: const EdgeInsets.symmetric(horizontal: 24),
        )
      ],
    );
  }
}
