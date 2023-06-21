import 'package:flutter/material.dart';
import 'package:untitled3/Front/aboutapp.dart';

import '../Front/body.dart';
import '../categeroy/category_grid_view.dart';
import '../categeroy/category_widget.dart';
import '../model/cheack.dart';
import '../news/search_screen.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Categroy> category = [
    Categroy(
        categoryId: "Sports",
        categoryImage: "assets/sport 1 (1).png",
        categoryTitle: "Sports",
        categoryBackground: Colors.black26),
    Categroy(
        categoryId: "general",
        categoryImage: "assets/sport 3.png",
        categoryTitle: "General",
        categoryBackground: Colors.black26),
    Categroy(
        categoryId: "health",
        categoryImage: "assets/first-aid-kit 1 (1).png",
        categoryTitle: "Health",
        categoryBackground: Colors.black26),
    Categroy(
        categoryId: "business",
        categoryImage: "assets/dc 1.png",
        categoryTitle: "Business",
        categoryBackground: Colors.black26),
    Categroy(
      categoryId: "technology",
      categoryImage: "assets/technology 1.png",
      categoryTitle: "Technology",
      categoryBackground: Colors.black26,
    ),
    Categroy(
        categoryId: "science",
        categoryImage: "assets/test 1.png",
        categoryTitle: "Science",
        categoryBackground: Colors.black26),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/Frame.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              selectedCategory == null
                  ? 'Fake News'
                  : selectedCategory!.categoryTitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            actions: [
              selectedCategory != null
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          drawer: Drawer(
            child: Column(children: [
              DrawerHeader(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 45),
                  decoration: BoxDecoration(),
                  height: double.infinity,
                  width: double.infinity,
                  child: Text(
                    'Fake News',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = null;
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Check()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_card_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Check',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => body()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const about()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.ad_units,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'About Us',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          body: selectedCategory == null
              ? Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black87),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 6 / 7,
                          ),
                          itemBuilder: (context, index) => CategoryGridView(
                            index: index,
                            categroy: category[index],
                            onClickItem: onClick,
                          ),
                          itemCount: category.length,
                        ),
                      ),
                    ],
                  ),
                )
              : CategoryNewsList(selectedCategory!),
        ),
      ],
    );
  }

  Categroy? selectedCategory = null;

  void onClick(Categroy categroy) {
    setState(() {
      selectedCategory = categroy;
    });
  }
}
