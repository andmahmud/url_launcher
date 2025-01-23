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
      theme: ThemeData(primarySwatch: Colors.blue),
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
      appBar: AppBar(title: const Text('Launcher Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _makePhoneCall('1234567890'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Make Phone Call'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _sendMessage('1234567890'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Send Message'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _launchUrl('https://www.andsayemxz.com'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Open URL'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _sendEmail('test@example.com'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
