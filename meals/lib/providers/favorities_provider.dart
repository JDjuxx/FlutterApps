import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool addFavoriteMeal(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

//LOS PROVIDERS CON NOTIFIER SON VARIABLES A LA FINAL QUE PUEDEN CONTENER SOLO DATOS O ENVIAR DATOS PARA SER MODIFICADOS
//SE PROPORCIONA EL TIPO DE NOTIFIER Y EL TIPO DE DATOS QUE TRANSPORTA
//
final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
