import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launcher Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Function to make a phone call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(callUri)) {
      throw Exception('Could not make the call to $phoneNumber');
    }
  }

  // Function to send a message
  Future<void> _sendMessage(String phoneNumber) async {
    final Uri messageUri = Uri(scheme: 'sms', path: phoneNumber);
    if (!await launchUrl(messageUri)) {
      throw Exception('Could not send a message to $phoneNumber');
    }
  }

  // Function to launch a URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  // Function to send an email
  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=Hello&body=This is a test email', // Pre-fill subject and body
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not send an email to $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launcher Example'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(
                label: 'Make Phone Call',
                color: Colors.green,
                icon: Icons.phone,
                onPressed: () => _makePhoneCall('1234567890'),
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                label: 'Send Message',
                color: Colors.blue,
                icon: Icons.message,
                onPressed: () => _sendMessage('1234567890'),
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                label: 'Open URL',
                color: Colors.orange,
                icon: Icons.link,
                onPressed: () => _launchUrl('https://www.andsayemxz.com'),
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                label: 'Send Email',
                color: Colors.red,
                icon: Icons.email,
                onPressed: () => _sendEmail('test@example.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: color,
        elevation: 5,
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
