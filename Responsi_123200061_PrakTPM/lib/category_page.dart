import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_categories.dart';
import 'category_meals_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() {
    http
        .get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    )
        .then((response) {
      if (response.statusCode == 200) {
        var categoriesJson = response.body;
        var categoriesMap = jsonDecode(categoriesJson);
        var categoryList = categoriesMap['categories'];
        setState(() {
          categories = List<Category>.from(
              categoryList.map((x) => Category.fromJson(x)));
        });
      } else {
        throw Exception('Failed to load categories');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Category'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2)),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MealsCategoryPage(
                            categoryName: categories[index].strCategory!),
                    ),
                ),
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1.0),
                      child: Image.network(
                        (categories[index].strCategoryThumb!),
/*                        height: 150.0,
                        width: double.infinity,*/
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        categories[index].strCategory!,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
