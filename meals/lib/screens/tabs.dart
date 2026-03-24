import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:meals/data/dummy_data.dart';
import 'package:meals/providers/favorities_provider.dart';
import 'package:meals/providers/filters_provider.dart';
//import 'package:meals/providers/meals_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

//LAS CLASES QUE USAN PROVIDER DEBEN CAMBIARSE A EXTEND CONSUMERSTATEFULWIDGET = STATEFULL WIDGET
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
  }

  // BOTTOMNAVIGATION BAR PARA HACER TABS EN LA PARTE DE ABAJO DE LA PANTALLA
  @override
  Widget build(BuildContext context) {
    //USO DE PROVIDERS PARA PASAR INFORMACION ENTRE SCREENS COMO LA PANTALLA DE COMIDAS FAVORITAS
    var activePageTitle = 'Categories';
    //final availableMeals = ref.watch(mealsProvider);
    //final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoritesMealsProvider);

      activePage = MealsScreen(favoritesMeals);
      activePageTitle = 'Your Favorites';
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          //BottomNavigationBarItem(icon: Icon(Icons.nat), label: 'jaja'),
          //BottomNavigationBarItem(icon: Icon(Icons.nat), label: 'jaja'),
        ],
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
