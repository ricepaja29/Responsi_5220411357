import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 127, 232),
        title: Text("Akun"),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Profile Picture and Info
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profilericep.jpg', // path ke gambar profil
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Ricep Ardiansyah',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Universitas Teknologi Yogyakarta',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Options
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Kelola Akun"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Notifikasi"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(context,
                        '/notifications'); // Add navigation action here
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Privacy Policy"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Add navigation action here
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Terms of Service"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Add navigation action here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/account');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        currentIndex: 1,
      ),
    );
  }
}
