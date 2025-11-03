import 'package:flutter/material.dart';

class ImageRetuner extends StatelessWidget {
  final String urlToImage;
  final double width;
  final double height;

  const ImageRetuner({
    super.key,
    required this.urlToImage,
    required this.width,
    required this.height
  });
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        urlToImage,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}