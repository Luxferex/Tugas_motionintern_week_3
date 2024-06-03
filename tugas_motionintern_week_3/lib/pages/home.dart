import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tugas_motionintern_week_3/model/kategori.dart';
import 'package:tugas_motionintern_week_3/widgets/grid%20.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:tugas_motionintern_week_3/pages/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int activeIndex = 0;

  final GlobalKey _navKey = GlobalKey();

  List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'color': Colors.black},
    {'icon': Icons.shopping_cart, 'color': Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 214, 214),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(87, 26, 4, 4),
                            blurRadius: 4,
                            offset: Offset(0.7, 0.8),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.menu),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(87, 26, 4, 4),
                            blurRadius: 4,
                            offset: Offset(0.7, 0.8),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.more_vert),
                    )
                  ],
                ),

                //search
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(left: 20, right: 15),
                  height: 55,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 47, 41, 41),
                        blurRadius: 1,
                        offset: Offset(2.7, 2.8),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 2.5),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.filter_alt_rounded),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                //grid
                StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: kategorigrid.asMap().entries.map((MapEntry map) {
                      int index = map.key;
                      return GestureDetector(
                        onTap: () {},
                        child: grid(index),
                      );
                    }).toList()),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      //navbar
      bottomNavigationBar: CircleNavBar(
          key: _navKey,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            } else {
              setState(() {
                activeIndex = index;
              });
            }
          },
          activeIndex: activeIndex,
          activeIcons: List.generate(
              navItems.length,
              (index) => Icon(
                    navItems[index]['icon'],
                    color: Colors.white,
                  )),
          inactiveIcons: List.generate(
              navItems.length,
              (index) => Icon(
                    navItems[index]['icon'],
                    color: Colors.black54,
                  )),
          height: 60,
          circleWidth: 60,
          circleColor: Color.fromARGB(255, 90, 104, 172),
          color: Color.fromARGB(255, 92, 90, 84).withOpacity(0.5)),
    );
  }
}
