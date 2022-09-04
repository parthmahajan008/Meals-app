import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  final String id;
  const MealDetailsScreen({Key? key, required this.id}) : super(key: key);
  Widget buildtitle(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildtitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(selectedMeal.ingredients[index]),
                      ));
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildtitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((ctx, index) => ListTile(
                      leading: CircleAvatar(child: Text("# ${index + 1}")),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(color: Colors.red),
                      ),
                    )),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
