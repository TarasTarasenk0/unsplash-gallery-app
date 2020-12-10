import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_gallery_app/models/unsplash_image.dart';
import 'package:unsplash_gallery_app/extensions/extension+String.dart';

class ImageCell extends StatelessWidget {
  double _bottomTextSubViewHeight = 100.0;
  double _emptyBottomTextSubViewHeight = 65.0;
  UnsplashImage model;

  ImageCell({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0, left: 8.0, top: 16.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl: model.images.regular,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            child: Container(
              height: (model.description == "")
                  ? _emptyBottomTextSubViewHeight
                  : _bottomTextSubViewHeight,
              width: MediaQuery.of(context).size.width - 40.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.user.name.capitalize(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2),
                        ),
                        SizedBox(width: 8.0),
                        Text("${model.likes}  ♥️",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: 2.0),
                    Text(model.description.capitalize(),
                        maxLines: 3, style: TextStyle(color: Colors.lime)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
