import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_meals.dart';
import 'detail_meals_page.dart';

class MealsCategoryPage extends StatefulWidget {
  String categoryName;

  MealsCategoryPage({super.key, required this.categoryName});

  @override
  State<MealsCategoryPage> createState() => _MealsCategoryPageState();
}

class _MealsCategoryPageState extends State<MealsCategoryPage> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  void fetchMeals() {
    http
        .get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.categoryName}'))
        .then((response) {
      if (response.statusCode == 200) {
        var mealsMap = jsonDecode(response.body);
        var mealList = mealsMap['meals'];
        setState(() {
          meals = List<Meal>.from(mealList.map((x) => Meal.fromJson(x)));
        });
      } else {
        throw Exception('Failed to load meals');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} Meals'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2)),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMealsPage(
                        mealId: meals[index].idMeal!,),
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
          (meals[index].strMealThumb!),
            height: 165.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
            ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.center,
                    child: Text(
                      meals[index].strMeal!,
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
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
