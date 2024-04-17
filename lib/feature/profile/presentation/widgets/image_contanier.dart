import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../core/constant/appColors.dart';
import '../../../../core/constant/imagesManager.dart';

class ImageContainer extends StatefulWidget {
  final Function(String) onSubmit;
  const ImageContainer({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  File? _image;

  Future<void> _getImageFromGallery() async {

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Correct usage of pickImage method

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image?.path);
        widget.onSubmit(_image!.path);
      } else {
        print('No image selected.');
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.accent.withAlpha(60),
      width: double.infinity,
      alignment: Alignment.center,
      height: 166,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.accent,
              border: Border.all(color: AppColors.accent, width: 2),
              borderRadius: BorderRadius.circular(70),
            ),
            child: _image != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.file(
                _image!,
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.asset(
                ImagesManager.doctorPlaceHolder,
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: _getImageFromGallery,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.accent,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
