import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

//EL WITH ES NECESARIO PARA CREAR NUESTRAS ANIMACIONES CON EL ANIMATION CONTROLLER.
//ANIMATION CONTROLLER TIENE VSYNC QUE ES UN TICKER PROVIDER QUE MANEJA LA ANIMACION.
//EL VSYNC AGARRA EL FRAMERATE DE LA TODA LA CLASE PONIENDO EL THIS.
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1620),
      //LOWER Y UPPER SON ENTRE QUE VALORES SE DIMENSIONARÁ LA ANIMACIÓN
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //PARA NAVEGAR ENTRE PANTALLAS EN LA PILA DE PANTALLAS.
    //SE DEBE PASAR EL CONTEXTO Y LA RUTA
    //LA RUTA RECIBE UNA FUNCION QUE DEVUELVE EL WIDGET O PANTALLA
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category,
              onSelectCategory: () {
                _selectedCategory(context, category);
              },
            )
        ],
      ),
      //HAY QUE JUGAR CON LOS ELEMENTOS PARA LAS ANIMACIONES NUMEROS, COLOR, MATEMATICA,
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: Offset(0.7, 0.9),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.bounceOut),
        ),
        child: child,
      ), /*Padding(
              padding: EdgeInsets.only(
                top: 100 - _animationController.value * 100,
                left: 100 - _animationController.value * 100,
                right: 100 - _animationController.value * 100,
              ),
              child: child,
            )*/
    );
  }
}
