import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: const Color.fromARGB(255, 0, 127, 232),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.notification_important, color: Colors.blue),
            title: Text('New update available'),
            subtitle: Text('Check out the latest features in our app.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi atau aksi saat notifikasi ditekan
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('New Update'),
                  content: Text('Learn about the latest features in our app.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.message, color: Colors.green),
            title: Text('Message from support'),
            subtitle: Text('Your issue has been resolved.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi atau aksi saat notifikasi ditekan
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Support Message'),
                  content: Text('Your issue has been successfully resolved.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event, color: Colors.red),
            title: Text('Event reminder'),
            subtitle: Text('Don\'t forget your upcoming event tomorrow.'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigasi atau aksi saat notifikasi ditekan
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Event Reminder'),
                  content: Text('Remember your event tomorrow at 10 AM.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(),
          // Tambahkan notifikasi lain sesuai kebutuhan
        ],
      ),
    );
  }
}
