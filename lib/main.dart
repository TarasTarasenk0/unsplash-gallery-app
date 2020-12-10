import 'package:flutter/material.dart';
import 'package:unsplash_gallery_app/models/unsplash_image.dart';
import 'package:unsplash_gallery_app/screens/detail_page.dart';
import 'package:unsplash_gallery_app/screens/widgets/images_cell.dart';
import 'api_service/api_service.dart';

void main() {
  runApp(GalleryHome());
}

class GalleryHome extends StatefulWidget {
  @override
  _GalleryHomeState createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  List<UnsplashImage> _images = [];
  bool _isUploaded = false;
  var _page = 0;

  @override
  initState() {
    super.initState();
    _getData();
  }

  Function _getData() {
    ApiService.instance.fetchData(_page).then((result) {
      setState(() {
        _images = _images + result;
        _isUploaded = true;
      });
    });
  }

  Widget _createListView(List<UnsplashImage> itemList) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        _isUploaded = false;
        _page++;
        _getData();
      }
    });
    return ListView.builder(
        controller: _scrollController,
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
              child: ImageCell(model: itemList[index]),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(imageUrl: itemList[index].images.regular)));
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: !_isUploaded
              ? CircularProgressIndicator()
              : _createListView(_images),
        ),
      ),
    );
  }
}
