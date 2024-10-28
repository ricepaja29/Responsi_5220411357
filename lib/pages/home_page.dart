import 'package:flutter/material.dart';
import 'SettingsPage.dart'; // Import halaman pengaturan

class HomePage extends StatelessWidget {
  // List data untuk Grid View (gambar, judul, dan subtitle)
  final List<Map<String, String>> gridItems = [
    {
      'image': 'assets/images/album1.png',
      'title': 'wisnu santika',
      'subtitle': 'Cartel'
    },
    {
      'image': 'assets/images/album2.jpg',
      'title': 'Aziz Hedra',
      'subtitle': 'Sombebodys pleasrue'
    },
    {
      'image': 'assets/images/album3.jpg',
      'title': 'Bruno Mar',
      'subtitle': 'Smile'
    },
    {
      'image': 'assets/images/album4.jpg',
      'title': 'Bernadya',
      'subtitle': 'Untungnya dunia masih berputar'
    },
  ];

  // List data untuk List View (gambar, headline, dan deskripsi)
  final List<Map<String, String>> listItems = [
    {
      'image': 'assets/images/album5.png',
      'headline': 'Coldplay',
      'description': 'Viva La Vida'
    },
    {
      'image': 'assets/images/album6.jpg',
      'headline': 'Juicy lucky',
      'description': 'Sialan'
    },
    {
      'image': 'assets/images/album7.jpg',
      'headline': 'The Weeknd',
      'description': 'Starboy'
    },
    {
      'image': 'assets/images/album8.jpg',
      'headline': 'Pamungkas',
      'description': 'Kenangan Manis'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 127, 232),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.person, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman pengaturan saat tombol "Settings" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ricep",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "My Favorite Album",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 250, // Menyesuaikan tinggi GridView agar tidak overflow
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image']!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['title']!,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          item['subtitle']!,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PlayList",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward, size: 16),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  final item = listItems[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(item['headline']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['description']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.today,
                                  size: 12, color: Colors.black54),
                              SizedBox(width: 4),
                              Text("Today · 23 min"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.play_arrow, size: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/account');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
      ),
    );
  }
}
