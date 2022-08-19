import 'package:flutter/material.dart';
import 'package:flutter_doctor_plus/common/constant/data.dart';
import '../widget/item_photo.dart';
import '../widget/library_app_bar.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, value) => [
                LibraryAppBar(
                  controller: _controller,
                  photos: 36,
                  documents: 34,
                  videos: 8,
                )
              ],
          body: TabBarView(
            controller: _controller,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return ItemPhoto(
                    photoModel: photos[index],
                  );
                },
              ),
              Container(),
              Container(),
            ],
          )),
    );
  }
}
