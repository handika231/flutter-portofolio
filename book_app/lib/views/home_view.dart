import 'package:book_app/controller/main_notifier.dart';
import 'package:book_app/model/ebook_model/ebook_model.dart';
import 'package:book_app/utils/result_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MainNotifier>(context, listen: false).getSlider();
      Provider.of<MainNotifier>(context, listen: false).getLatest();
      Provider.of<MainNotifier>(context, listen: false).getComing();
      Provider.of<MainNotifier>(context, listen: false).getCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MainNotifier>(context, listen: false);
    return SafeArea(
      child: Consumer<MainNotifier>(
        builder: (context, value, child) {
          switch (value.state) {
            case ResultState.loading:
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.sp,
                ),
              );
            case ResultState.hasData:
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 250.h,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      background: _buildSlider(value),
                    ),
                  ),
                  sliverTitle('Latest'),
                  SliverToBoxAdapter(
                    child: _buildLatest(value),
                  ),
                  sliverTitle('Coming Soon'),
                  SliverToBoxAdapter(
                    child: _buildComing(value),
                  ),
                  sliverTitle('Category', isCategory: true),
                  _buildGrid(value),
                ],
              );
            default:
              return Text(value.message);
          }
        },
      ),
    );
  }

  SliverGrid _buildGrid(MainNotifier value) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  value.listOfCategory[index].photoCat ?? '',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                value.listOfCategory[index].name ?? '',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
          );
        },
        childCount: value.listOfCategory.length,
      ),
    );
  }

  SliverToBoxAdapter sliverTitle(String title, {bool isCategory = false}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          title,
          textAlign: isCategory ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(MainNotifier value) {
    return Column(
      children: [
        SizedBox(
          width: 1.sw,
          height: 200.h,
          child: PageView.builder(
            onPageChanged: value.changeSliderPosition,
            controller: value.pageController,
            itemCount: value.listOfSliders.length,
            itemBuilder: (context, index) {
              EbookModel ebook = value.listOfSliders[index];
              return Padding(
                padding: EdgeInsets.all(12.0.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.network(
                        ebook.photo ?? '',
                        width: 1.sw,
                        height: 250.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.black,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ebook.title ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        DotsIndicator(
          decorator: DotsDecorator(
            color: Colors.black,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: Colors.lightBlue,
          ),
          axis: Axis.horizontal,
          position: value.sliderPosition.toDouble(),
          dotsCount: value.listOfSliders.length,
          onTap: (position) {
            value.changeSlider(position.toInt());
          },
        ),
      ],
    );
  }

  Widget _buildLatest(MainNotifier value) {
    return SizedBox(
      height: 225.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: value.listOfLatest.length + 1,
        itemBuilder: (context, index) {
          if (index == value.listOfLatest.length) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Center(
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          } else {
            EbookModel ebook = value.listOfLatest[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    ebook.photo ?? '',
                    width: 150.w,
                    height: 150.h,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      ebook.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildComing(MainNotifier value) {
    return Container(
      color: Colors.grey[200],
      height: 225.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: value.listOfComing.length,
        itemBuilder: (context, index) {
          EbookModel ebook = value.listOfComing[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  ebook.photo ?? '',
                  width: 150.w,
                  height: 150.h,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    ebook.title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
