import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  static const routeName = '/category-meals';
  //final String categoryID;
  //final String categoryTitle;
  //CategoryMealScreen(this.categoryID, this.categoryTitle);
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeargs['title'];
    final categoryId = routeargs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              Title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
