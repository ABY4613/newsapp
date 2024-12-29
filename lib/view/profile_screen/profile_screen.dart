import 'package:flutter/material.dart';
import 'package:newsapp/utils/images_const.dart';
import 'package:newsapp/view/login_screen/login_screen.dart';
import 'package:newsapp/view/signout_screen/signout_screen.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 40,
                  child:ClipOval(child: Image(image: AssetImage("assets/images/image.png"))),
                  // backgroundImage: AssetImage(ImageConstants.MYAPPLOGO,),
                ),
                const SizedBox(width: 16),
                // Name and Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'aby babu',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    const SizedBox(height: 5),
                    Text(
                    savedUsername??"",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Settings Options
          Expanded(
            child: ListView(
              children: [
                // // Notifications Toggle
                // ListTile(
                //   title: const Text(
                //     'Notifications',
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.black,
                //     ),
                //   ),
                //   trailing: Switch(
                //     value: _notificationsEnabled,
                //     onChanged: (value) {
                //       setState(() {
                //         _notificationsEnabled = value;
                //       });
                //     },
                //   ),
                // ),
               
                const Divider(height: 1, color: Colors.grey),
                // Other Settings
                buildSettingsItem('Language', Icons.arrow_forward_ios),
                buildSettingsItem('Change Password', Icons.arrow_forward_ios),
                buildSettingsItem('Privacy', Icons.arrow_forward_ios),
                buildSettingsItem('Terms & Conditions', Icons.arrow_forward_ios),
                InkWell(
                  onDoubleTap: () {
                    
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignoutScreen(),
            ));}, 
                  child: buildSettingsItem(
                    'Sign Out',
                    Icons.logout,
                    textColor: Colors.redAccent,
                    iconColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }

  // Helper Widget for Settings ListTile
  Widget buildSettingsItem(String title, IconData icon,
      {Color textColor = Colors.black, Color iconColor = Colors.grey}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing: Icon(icon, size: 16, color: iconColor),
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
