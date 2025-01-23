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
      title: 'URL Launcher',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Function to launch a URL
  Future<void> _launchUrl() async {
    final Uri url =
        Uri.parse('https://www.google.com'); // Replace with your URL
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL Launcher')),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchUrl,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text('Open Website'),
        ),
      ),
    );
  }
}
