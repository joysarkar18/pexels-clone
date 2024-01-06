import 'package:flutter/material.dart';
import 'package:pexels/api/future_get_photos.dart';
import 'package:pexels/constants/custom_colors.dart';
import 'package:pexels/models/photo_model.dart';
import 'package:pexels/shimmer/home_page_shimmer.dart';
import 'package:pexels/widgets/img_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  int pageNo = 0;
  final List<PhotoModel> _result = [];
  final _scrollController = ScrollController();

  Future<void> _loadMore() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    List<PhotoModel> response = await fetchPhotos(
      page: pageNo,
      perPage: 20,
    );

    setState(() {
      _isLoading = false;
      _result.addAll(response);
      pageNo++;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
    _scrollController.addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    print(_result);
    return Scaffold(
      backgroundColor: bgMain,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 50, child: Image.asset("assets/pngwing.com.png")),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: bgMain),
            child: Column(
              children: [
                ..._result.map((e) {
                  return ImageContainer(key: UniqueKey(), photo: e);
                }).toList(),
                pageNo == 0 && _isLoading
                    ? const Column(
                        children: [
                          HomePageShimmer(),
                          HomePageShimmer(),
                          HomePageShimmer(),
                          HomePageShimmer(),
                        ],
                      )
                    : const SizedBox(),
                _isLoading ? const HomePageShimmer() : const SizedBox(),
              ],
            )),
      )),
    );
  }
}
