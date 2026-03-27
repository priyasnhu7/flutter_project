
// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/post_list.dart';
import 'package:hola_app/models/post_model.dart';
import 'package:hola_app/pages/landing_section/landing.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final TextEditingController postController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  File? selectedImage;
  final picker = ImagePicker();

  Future getImageGallery() async{
    final PickedFile =await picker.pickImage(
      source: ImageSource.gallery ,
      imageQuality: 80,
      );
      setState(() {
        if(PickedFile != null){
          selectedImage = File(PickedFile.path);
        }
        else{
          print(" No Image picked");
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: SingleChildScrollView(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
        title: const Text(
          
          'CREATE POST',
          style: TextStyle(fontSize: 15,color: whiteColor)
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: iconColor),
                controller: captionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Add a Caption',hintStyle: TextStyle(color: iconColor),
                ),
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: greyColor),
                      child: const Center(
                        child: Text(
                          'Select a Image',
                          style: TextStyle(fontSize: 15)
                        ),
                      ),
                    ),
              TextButton.icon(
                onPressed: getImageGallery,
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'),
              ),
              const SizedBox(height: 10),
              // Post Content TextField
              TextField(
                style: const TextStyle(color: iconColor),
                controller: postController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'What\'s on your mind?',hintStyle: TextStyle(color: iconColor),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (postController.text.isNotEmpty || selectedImage != null) {
                    setState(
                      () {
                        postList.add(
                          PostModel(text: postController.text,
                          caption: captionController.text,
                          image: selectedImage!,
                          comments: 30,
                          likes: 120,
                          isliked: false)
                          );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Landing()));
                      },
                    );
                    postController.clear();
                    captionController.clear();
                    selectedImage = null;
                  }
                },
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    ));}
  }