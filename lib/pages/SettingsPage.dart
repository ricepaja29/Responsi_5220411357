import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false; // Toggle untuk dark mode
  bool notificationsEnabled = true; // Toggle untuk notifikasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 0, 127, 232),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Section 1: Akun
          Text(
            'Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(),

          // Section 2: Preferensi
          SizedBox(height: 20),
          Text(
            'Preferences',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                // Implementasikan perubahan tema jika perlu
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Enable Notifications'),
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),

          // Section 3: Keamanan
          SizedBox(height: 20),
          Text(
            'Security',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/change_password'); // Pastikan halaman ini sudah diatur di routes
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Two-Factor Authentication'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman pengaturan autentikasi dua faktor
            },
          ),
          Divider(),

          // Section 4: Lainnya
          SizedBox(height: 20),
          Text(
            'Others',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi ke halaman About jika tersedia
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
