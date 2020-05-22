import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreerGitesPage2 extends StatefulWidget {
  @override
  _CreerGitesPage2State createState() => _CreerGitesPage2State();
}

class _CreerGitesPage2State extends State<CreerGitesPage2> {
  File _image;

  Future getImageCam() async {
    if (_locationImages.length < 10) {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image as File;
        _locationImages.add(_image);
      });
    }
  }

  Future getImageGal() async {
    if (_locationImages.length < 10) {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image as File;
      _locationImages.add(_image);
    });
    }
  }

  int _locationIndex = 0;
  List<File> _locationImages = [];

  //carossel
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void _previousImage() {
    setState(() {
      _locationIndex = _locationIndex > 0 ? _locationIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      _locationIndex = _locationIndex < _locationImages.length - 1
          ? _locationIndex + 1
          : _locationIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height,
        screenWidth = MediaQuery.of(context).size.width,
        imageHeight = screenHeight / 1.8,
        dotTop = screenHeight / 2,
        iconTop = screenHeight / 4;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hohaya'),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Ajouter les images",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //Images defilantes

              //Precedent suivant
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Caméra"),
                    color: Colors.blueAccent,
                    onPressed: getImageCam,
                  ),
                  SizedBox(width: 50),
                  RaisedButton(
                    child: Text("Galerie"),
                    color: Colors.indigo,
                    onPressed: getImageGal,

                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: imageHeight,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _locationIndex = index;
                          reason = CarouselPageChangedReason.timed;
                        });
                      },
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: _locationImages.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(0.0),
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height - 550,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Image.file(
                                imgUrl,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map(_locationImages, (index, url) {
                      return Container(
                        width: _locationIndex == index ? 9.0 : 7.0,
                        height: _locationIndex == index ? 9.0 : 7.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                          _locationIndex == index ? Colors.black38 : Colors
                              .grey[350],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              //Precedent suivant

            ],
          ),
        ],
      ),
    );
  }
}
