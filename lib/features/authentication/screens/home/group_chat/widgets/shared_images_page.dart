import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';


class SharedImagesPage extends StatefulWidget {
  const SharedImagesPage({Key? key}) : super(key: key);

  @override
  _SharedImagesPageState createState() => _SharedImagesPageState();
}

class _SharedImagesPageState extends State<SharedImagesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Images and Files'),
        bottom: TabBar(
          controller: _tabController,
          dividerColor: TColors.primaryColor,
          labelColor: TColors.primaryColor,
          unselectedLabelColor: TColors.kDarkGrey,
          tabs: const [

            Tab(text: 'Images'),
            Tab(text: 'Files'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Images Tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 6, // Replace with the actual number of shared images
              itemBuilder: (context, index) {
                return Image.asset(
                  'assets/images/shared_image_$index.jpg', // Replace with the actual image path or network image
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Files Tab
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 5, // Replace with the actual number of shared files
            itemBuilder: (context, index) {
              return Icon(Icons.file_present); // Replace with the appropriate file icon
            },
          ),
        ],
      ),
    );
  }
}