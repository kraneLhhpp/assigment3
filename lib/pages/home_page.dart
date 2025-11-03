import 'package:flutter/material.dart';
import 'package:mobilka_news_api/domain/entity/news.dart';
import 'package:mobilka_news_api/widgets/news_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<News> articles = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {});
    });
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
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Image.asset(
            'assets/images/leadingLogo.png',
            width: 100,
            height: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Color(0xFFA0A3BD)),
                  suffixIcon: const Icon(Icons.display_settings_outlined,
                      color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black54),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: TabBar(
                isScrollable: true,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Politics'),
                  Tab(text: 'Business'),
                  Tab(text: 'Health'),
                  Tab(text: 'Travel'),
                  Tab(text: 'Science'),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewsList(category: ''),
                    NewsList(category: 'sports'),
                    NewsList(category: 'politics'),
                    NewsList(category: 'business'),
                    NewsList(category: 'health'),
                    NewsList(category: 'travel'),
                    NewsList(category: 'science'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
