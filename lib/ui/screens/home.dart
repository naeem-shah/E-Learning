import 'package:flutter/material.dart';
import 'package:qubo/ui/widgets/course_widget.dart';
import 'package:qubo/ui/widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = [
    "All",
    "Design",
    "Communication",
    "Development"
  ];
  final List<NavModel> navigation = [
    NavModel("Home", Icons.home_rounded),
    NavModel("Saved", Icons.bookmark_outline_rounded),
    NavModel("Course", Icons.menu_book_rounded),
    NavModel("Library", Icons.video_library_outlined),
  ];

  String _selectedFilter = "All";
  int _selectedNav = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: filters
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: ChoiceChip(
                            label: Text(e),
                            onSelected: (bool value) {
                              if (value) {
                                _selectedFilter = e;
                              }
                              setState(() {});
                            },
                            selected: e == _selectedFilter,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: e == _selectedFilter
                                      ? Colors.white
                                      : null,
                                ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ON SALE",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "View All",
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 21 / 9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                right: 16,
              ),
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const CourseWidget(
                    image: "assets/images/image1.png",
                    discountedAmount: "9.99",
                    amount: "49.99",
                    title: "Spoken English",
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular courses".toUpperCase(),
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemBuilder: (_, index) {
              String image = "assets/images/image2.png";
              String title = "Product Design";
              if (index == 1) {
                image = "assets/images/image3.png";
                title = "Project Management";
              }
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: CourseWidget(
                  image: image,
                  discountedAmount: "9.99",
                  title: title,
                ),
              );
            },
            itemCount: 3,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xff6141BB),
          shape: StadiumBorder(),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          height: 66,
          destinations: navigation.map((nav) {
            int index = navigation.indexOf(nav);
            Color color = Colors.white.withOpacity(0.5);

            if (index == _selectedNav) {
              color = Colors.white;
            }

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedNav = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    nav.iconData,
                    color: color,
                  ),
                  Text(
                    nav.title,
                    style: textTheme.bodyMedium?.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavModel {
  String title;
  IconData iconData;

  NavModel(this.title, this.iconData);
}

class OutlineModel {
  String image;
  String? number;
  String outline;

  OutlineModel({
    required this.image,
    this.number,
    required this.outline,
  });
}
