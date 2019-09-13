import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:nice_button/nice_button.dart';

class ProfileImageUpload extends StatefulWidget {
  ProfileImageUpload() {
    print("Calling from constructor.......");
  }

  @override
  _ProfileImageUploadState createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {
  @override
  void initState() {
    super.initState();
    print("Calling from init State..");
    _selectedImage.value = File("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xfffcaa20), Color(0xff583861)])),
              child: FlexibleSpaceBar(
                title: Text("Profile Pictures"),
              ),
            ),
          )
        ],
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _uploadButton(context),
                  SizedBox(
                    height: 20,
                  ),
                  
                  ProfilePicList(),
                  SizedBox(height: 14),
                  Container(
                    //color: Colors.redAccent,
                    child: _SelectedImageWidget(),
                  ),
                  
                  SizedBox(height: 16),
                  _uploadButton(context)
                  // NiceButton(
                  //   text: "Logout",
                  //   fontSize: 16,
                  //   width: 100,
                  //   onPressed: logout,
                  //   background: Colors.amber,
                  // )
                ],
              ),
            )),
      ),
    );
  }

  Widget _uploadButton(BuildContext context) {
    return Column(
      children: <Widget>[
        NiceButton(
          text: "Select Image",
          gradientColors: [Colors.blueGrey, Colors.blue],
          background: Colors.blue,
          onPressed: _getImage,
          radius: 30,
          elevation: 16,
        ),
        SizedBox(height: 8),
        NiceButton(
          text: "Upload",
          background: Colors.brown,
          gradientColors: [Colors.green, Colors.blueGrey],
          onPressed: _storeImage,
          radius: 12,
          elevation: 10,
          fontSize: 12,
          width: 100,
        ),
      ],
    );
  }
}

class _SelectedImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedImage,
      builder: (context, File image, child) {
        if (image.path == "") return Container();
        return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              image,
              height: 240,
              width: 160,
              fit: BoxFit.fitHeight,
            ));
      },
    );
  }
}

ValueNotifier<File> _selectedImage = ValueNotifier(File(""));

Future _getImage() async {
  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  if (image != null) _selectedImage.value = image;
}

Future _storeImage() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  print(appDocDir.path);
  String imagePath = join(appDocDir.path, 'profile_images',
      _selectedImage.value.path.split("/").last);
  print(imagePath);
  var myImage = File(imagePath);
  myImage.createSync(recursive: true);
  _selectedImage.value.copySync(myImage.path);
  print("Done");
  _getStoredImage();
  _selectedImage.value = File("");
}

Future<List<FileSystemEntity>> _getStoredImage() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String imageDirPath = join(appDocDir.path, 'profile_images');
  Directory imageDir = Directory(imageDirPath);
  List<FileSystemEntity> l = imageDir.listSync();
  print(l.length);
  return l;
}

class ProfilePicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedImage,
      builder: (context, val, child) {
        return Container(
          child: FutureBuilder(
            future: _getStoredImage(),
            builder: (context, AsyncSnapshot<List<FileSystemEntity>> snapshot) {
              if (!snapshot.hasData)
                return Container(
                  child: Text("No Images"),
                );
              return Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.map((file) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: MediaQuery.of(context).size.width*.7,
                        child: ListTile(
                          onTap: () {
                            print("Deleter");
                          },
                          leading: ClipRRect(
                            child: Image.file(file),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text("FileName"),
                          trailing: IconButton(
                            onPressed: () {
                              print("Deleter");
                              file.deleteSync();
                              _selectedImage.value = File("");
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
