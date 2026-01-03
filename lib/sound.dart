import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _controller = TextEditingController(
    text: "Hello! Type something here and press the button.",
  );

  // Default settings
  String _selectedLanguage = "en-US";
  final double _volume = 0.9;
  final double _pitch = 1.1;
  final double _rate = 0.5;

  // Function to handle speaking
  Future<void> _speak() async {
    await flutterTts.setLanguage(_selectedLanguage);
    await flutterTts.setPitch(_pitch);
    await flutterTts.setVolume(_volume);
    await flutterTts.setSpeechRate(_rate);

    if (_controller.text.isNotEmpty) {
      await flutterTts.speak(_controller.text);
    }
  }

  // Stop speaking
  Future<void> _stop() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter TTS Pro"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Text Input Field
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter text to speak...",
              ),
            ),
            const SizedBox(height: 20),

            // Language Dropdown
            const Text(
              "Select Language:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedLanguage,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "en-US", child: Text("English (US)")),
                DropdownMenuItem(value: "en-GB", child: Text("English (UK)")),
                DropdownMenuItem(value: "es-ES", child: Text("Spanish")),
                DropdownMenuItem(value: "fr-FR", child: Text("French")),
                DropdownMenuItem(value: "de-DE", child: Text("German")),
                DropdownMenuItem(value: "hi-IN", child: Text("Hindi")),
                DropdownMenuItem(value: "ja-JP", child: Text("Japanese")),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),

            const SizedBox(height: 30),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _speak,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("SPEAK"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _stop,
                  icon: const Icon(Icons.stop),
                  label: const Text("STOP"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              "Tip: Make sure your media volume is up!",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
