import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _urlController = TextEditingController();

  void _startExtraction() {
    // Backend logic for extraction will be implemented later.
    // For now, we can show a dialog or a snackbar.
    final url = _urlController.text;
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('कृपया एक URL दर्ज करें')),
      );
      return;
    }
    
    // Placeholder for starting the extraction process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"${url}" से अध्याय निकालना शुरू कर रहा है...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('उपन्यास एक्सट्रैクター'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'उपन्यास का URL यहाँ पेस्ट करें:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'https://...',
                hintText: 'उपन्यास के पहले अध्याय का URL दर्ज करें',
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _startExtraction,
              icon: const Icon(Icons.download_for_offline_outlined),
              label: const Text('अध्याय निकालना शुरू करें'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}
