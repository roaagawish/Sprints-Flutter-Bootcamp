import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<File> images = [];

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? pickedFiles = await imagePicker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        images = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
  
              Expanded(
                child: images.isEmpty ? Center(child: Text("No images picked")) : ListView.builder(
                  itemCount: images.length,
                  itemBuilder:(context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(images[index]),
                      )),
              ),
          
                    
              ElevatedButton(onPressed: pickImage, 
              child: Text("Pick Image"))
            ],
          ),
        ),
      ),
    );
  }
}