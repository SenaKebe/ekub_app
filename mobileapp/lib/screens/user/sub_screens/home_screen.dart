import 'package:flutter/material.dart';
import 'package:mobileapp/models/category_model.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/screens/user/detail_screen/lot_list_in_category.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: Provider.of<DataProvider>(context)
              .categories
              .map((e) => CategoryCardWidget(
                    category: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(category.id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LotoListWidget(category: category)),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          bool isMinScreen = constraints.maxWidth < 410;
          return Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                // Left part
                Container(
                  width: constraints.maxWidth * 0.25,
                  padding: EdgeInsets.all(
                    constraints.maxWidth * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        category.id.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isWideScreen ? 26 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        isWideScreen
                            ? formatDateTimeTwo(category.createdAt)
                            : formatDateTimeThree(category.createdAt),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isWideScreen ? 16 : 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isMinScreen ? 5 : 15),
                // Right part
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: constraints.maxWidth * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1st row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 40),
                              Text(
                                category.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 1,
                          ),
                          // 2nd row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount:",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    category.amount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Commission:",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    category.commition.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 10,
                            thickness: 1,
                          ),
                          // 3rd row
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Collection Cycle:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                category.collectionCycle,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

// Dummy function to simulate date formatting
String formatDateTimeTwo(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}

String formatDateTimeThree(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month}";
}
