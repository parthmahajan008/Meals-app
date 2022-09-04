import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id})
      : super(key: key);
  String get complexitytext {
    if (complexity == Complexity.Simple) {
      return "Simple";
    }
    if (complexity == Complexity.Hard) {
      return "Hard";
    }
    if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else {
      return "unknown";
    }
  }

  String get affordabilitytext {
    if (affordability == Affordability.Pricey) {
      return "Pricey";
    }
    if (affordability == Affordability.Affordable) {
      return "Affordable";
    }
    if (affordability == Affordability.Luxurious) {
      return "Luxurious";
    } else {
      return "unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return MealDetailsScreen(
          id: id,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  // ignore: prefer_const_constructors
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  // SizedBox(width: 15),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexitytext)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.money,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilitytext),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
