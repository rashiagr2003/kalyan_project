import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class KalyanHomePage extends StatelessWidget {
  final ApiServicenew _apiService = ApiServicenew();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalyan'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 'share':
                  // Handle share action
                  break;
                case 'rate':
                  // Handle rate app action
                  break;
                case 'logout':
                  // Handle logout action
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'share',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.share),
                    SizedBox(width: 8.0),
                    Text('Share With Friends'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'rate',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.star),
                    SizedBox(width: 8.0),
                    Text('Rate App'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 8.0),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/1e/95/be/1e95bea3f2d754a677b53a0b089f0782.jpg',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Rashi',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '9452935405',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact Us'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Terms & Conditions'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text('Change Password'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder<AppDetailsModel>(
        future: _apiService.fetchAppDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final appDetails = snapshot.data!;
            return Column(
              children: [
                _buildCarousel(appDetails.data?.bannerImage, height: 300.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: schedules.length,
                      itemBuilder: (context, index) {
                        final schedule = schedules[index];
                        return ScheduleCard(
                          title: schedule['title']!,
                          schedule: schedule['time']!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: Text('No Data Available'));
        },
      ),
    );
  }

  Widget _buildCarousel(BannerImage? bannerImage, {double height = 200.0}) {
    if (bannerImage == null) {
      return Container();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
        scrollPhysics: const NeverScrollableScrollPhysics(),
      ),
      items: [
        if (bannerImage.bannerImg1 != null)
          Image.network(bannerImage.bannerImg1!, fit: BoxFit.cover),
        if (bannerImage.bannerImg2 != null)
          Image.network(bannerImage.bannerImg2!, fit: BoxFit.fill),
        if (bannerImage.bannerImg3 != null)
          Image.network(bannerImage.bannerImg3!, fit: BoxFit.cover),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String schedule;

  const ScheduleCard({
    Key? key,
    required this.title,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: AppColors.primaryBlue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              schedule,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> schedules = [
  {'title': 'Mahadev Morning', 'time': '12:25 AM to 12:30 AM'},
  {'title': 'Sridevi Morning', 'time': '09:30 AM to 10:30 AM'},
  {'title': 'Chennai Morning', 'time': '10:00 AM to 11:00 AM'},
  {'title': 'Milan Morning', 'time': '10:15 AM to 11:15 AM'},
  {'title': 'Kalyan Morning', 'time': '12:00 PM to 01:00 PM'},
];

class AppDetailsModel {
  final AppDetailsData? data;
  AppDetailsModel({this.data});

  factory AppDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppDetailsModel(
      data: AppDetailsData.fromJson(json['data']),
    );
  }
}

class AppDetailsData {
  final BannerImage? bannerImage;
  AppDetailsData({this.bannerImage});

  factory AppDetailsData.fromJson(Map<String, dynamic> json) {
    return AppDetailsData(
      bannerImage: BannerImage.fromJson(json['bannerImage']),
    );
  }
}

class BannerImage {
  final String? bannerImg1;
  final String? bannerImg2;
  final String? bannerImg3;

  BannerImage({this.bannerImg1, this.bannerImg2, this.bannerImg3});

  factory BannerImage.fromJson(Map<String, dynamic> json) {
    return BannerImage(
      bannerImg1: json['banner_img_1'],
      bannerImg2: json['banner_img_2'],
      bannerImg3: json['banner_img_3'],
    );
  }
}

class ApiServicenew {
  Future<AppDetailsModel> fetchAppDetails() async {
    return AppDetailsModel.fromJson({
      'data': {
        'bannerImage': {
          'banner_img_1':
              'https://thumbs.dreamstime.com/z/illustration-lord-ganesha-ganesh-chaturthi-ai-generated-illustration-lord-ganesha-ganesh-chaturthi-281152754.jpg',
          'banner_img_2':
              'https://thumbs.dreamstime.com/b/ai-generated-image-maa-saraswati-goddess-knowledge-wisdom-sanatan-dharma-alongwith-two-swans-sitting-white-307542852.jpg',
          'banner_img_3':
              'https://i.pinimg.com/564x/1e/95/be/1e95bea3f2d754a677b53a0b089f0782.jpg',
        }
      },
    });
  }
}
