import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item_widget.dart';
import '../dummy_data.dart';

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals App"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio:
              3 / 2, //which means for 200 width , 300 is the height
          mainAxisSpacing: 20, //how much distance bewtween column and row
          crossAxisSpacing: 20,
        ),
        children: dummycategories
            .map((categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                color: categoryData.color))
            .toList(),
      ),
    );
  }
}
