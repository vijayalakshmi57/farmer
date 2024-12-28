import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PlantIdentifierPage extends StatefulWidget {
  const PlantIdentifierPage({super.key});

  @override
  _PlantIdentifierPageState createState() => _PlantIdentifierPageState();
}

class _PlantIdentifierPageState extends State<PlantIdentifierPage> {
  File? _image;
  String _result = "Plant information will appear here.";
  bool _isLoading = false;

  final _imagePicker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isLoading = true; // Show loading indicator when the image is picked
      });
      _identifyPlant(_image!);
    }
  }

  // Function to identify the plant using the Plant.id API
  Future<void> _identifyPlant(File image) async {
    const String apiKey = 'YOUR_API_KEY'; // Replace with your Plant.id API key
    const String apiUrl = 'https://api.plant.id/v2/identify';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['api_key'] = apiKey
        ..files.add(await http.MultipartFile.fromPath('images', image.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);

        setState(() {
          _result = "Plant: ${data['suggestions'][0]['plant_name']}";
          _isLoading = false; // Hide loading indicator after identifying
        });
      } else {
        setState(() {
          _result = "Failed to identify plant. Please try again.";
          _isLoading = false; // Hide loading indicator if there is an error
        });
      }
    } catch (e) {
      setState(() {
        _result = "Error: $e";
        _isLoading = false; // Hide loading indicator if there is an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Identifier'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the selected image or a placeholder text
            _image != null
                ? Image.file(_image!)
                : const Text('No image selected.',
                    style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            // Button to pick an image
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick an Image'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Green button color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(height: 20),

            // Display loading indicator or result
            _isLoading
                ? CircularProgressIndicator() // Show loading while the image is being processed
                : Text(
                    _result,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
          ],
        ),
      ),
    );
  }
}
