import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/data/api/endpoint.dart';
import 'package:news_app/data/constants/assets.dart';
import 'package:news_app/data/constants/datas.dart';
import 'package:news_app/logic/home_logic.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/home/widget/home_latest.dart';
import 'package:news_app/pages/home/widget/home_trending.dart';
import 'package:news_app/utils/date_format.dart';
import 'package:news_app/widgets/text_field/text_field_dual_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeLogic _homeLogic;
  late String dateNow;
  String keyword = 'All';

  @override
  void initState() {
    super.initState();
    _homeLogic = HomeLogic();
    dateNow = MyDateFormat().dateLater('yyyy-MM-dd', 3);
    var params = {
      "q": keyword,
      "from": dateNow,
      "sortBy": "publishedAt",
      "apiKey": Endpoints.key
    };
    _homeLogic.getNews(params);

    var paramHeadlines = {
      "country": "us",
      "category": "",
      "apiKey": Endpoints.key
    };
    _homeLogic.getHeadlinesNews(paramHeadlines);
  }

  void onTapLatestCat(String data) {
    setState(() {
      if (data == 'All') {
        keyword = 'All';
      } else if (data == 'Sports') {
        keyword = 'sport';
      } else if (data == 'Politics') {
        keyword = 'politic';
      } else if (data == 'Business') {
        keyword = 'business';
      } else if (data == 'Health') {
        keyword = 'health';
      } else if (data == 'Travel') {
        keyword = 'travel';
      } else if (data == 'Science') {
        keyword = 'science';
      }
    });
    var params = {
      "q": keyword,
      "from": dateNow,
      "sortBy": "publishedAt",
      "apiKey": Endpoints.key
    };
    _homeLogic.getNews(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ASSETS.kabarLogo,
                      width: 75,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      width: 32,
                      height: 32,
                      child: const Center(child: Icon(Icons.notifications)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: TextFieldDualIcons(
                  icon: const Icon(Icons.search),
                  icon2: const Icon(Icons.tune_rounded),
                  onSubmitted: () {},
                  hintText: 'Search',
                  onPressIcon: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HomeTrending(),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<List<NewsModel>>(
                stream: _homeLogic.newsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeLatest(
                      header: CONSTANT_DATA.header_news,
                      onPressCategory: onTapLatestCat,
                      data: snapshot.data,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
