import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class StorageService {
  final CloudinaryPublic cloudinary = CloudinaryPublic(
    'dftuekoej', // Replace with your Cloudinary cloud name
    'Shopify', // Replace with your upload preset
    cache: false,
  );

  // TO UPLOAD IMAGE TO CLOUDINARY
  Future<String?> uploadImage(String path, BuildContext context) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Uploading image...")));
    print("Uploading image...");

    try {
      // Upload the file to Cloudinary
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          path,
          folder: 'shop_images', // Specify the folder in Cloudinary
        ),
      );

      // Get the secure URL of the uploaded file
      String downloadURL = response.secureUrl;
      print("Download URL: $downloadURL");
      return downloadURL;
    } catch (e) {
      print("There was an error during the upload");
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to upload image")),
      );

      return null;
    }
  }
}
