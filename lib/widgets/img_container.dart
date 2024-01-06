import 'package:flutter/material.dart';
import 'package:pexels/models/photo_model.dart';

class ImageContainer extends StatelessWidget {
  final PhotoModel photo;
  const ImageContainer({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      width: MediaQuery.of(context).size.width,
      child: Image.network(photo.src.large),
    );
  }
}
