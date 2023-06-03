import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'meals_detail.dart';

class DetailMealsPage extends StatefulWidget {
  String mealId;
  DetailMealsPage({super.key, required this.mealId});

  @override
  State<DetailMealsPage> createState() => _DetailMealsPageState();
}

class _DetailMealsPageState extends State<DetailMealsPage> {
  MealDetail mealDetail = MealDetail();

  @override
  void initState() {
    super.initState();
    fetchMealDetail();
  }

  void fetchMealDetail() {
    http
        .get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealId}'))
        .then((response) {
      if (response.statusCode == 200) {
        var mealsMap = jsonDecode(response.body);
        var mealList = mealsMap['meals'];
        setState(() {
          mealDetail = MealDetail.fromJson(mealList[0]);
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
          title: const Text('Meal Detail'),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    if (mealDetail.strMeal == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  mealDetail.strMeal!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Image.network(mealDetail.strMealThumb ?? ''),
              const SizedBox(height: 16),
              Text(
                "Category : ${mealDetail.strCategory ?? ''}",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              // make this text align left
              Text("Area : ${mealDetail.strArea ?? ''}",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.left),
              const SizedBox(height: 16),
              Text(mealDetail.strInstructions ?? '',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify),
              const SizedBox(height: 16),
              Text('Tags : ${mealDetail.strTags ?? ''}'),
              const SizedBox(height: 16),
              buildIngredients(),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(mealDetail.strYoutube!);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                child: const Text('Lihat Video Youtube'),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget buildIngredients() {
    List<Widget> widgets = [];

    for (var i = 1; i <= mealDetail.ingredients!.length; i++) {
      widgets.add(Text(
          '${mealDetail.ingredients![i - 1]} ${mealDetail.measurements![i - 1]}',
          style: const TextStyle(fontSize: 16)));
    }
    return Column(
      children: [
        const Text(
          'Ingredients :',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ],
    );
  }
}
