import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorities_provider.dart';

//LAS CLASES QUE USAN PROVIDER DEBEN CAMBIARSE A EXTEND CONSUMER WIDGET = STATELESS WIDGET
class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;

  //SINGLE CHILD SCROLL VIEW puede funcionar o LIST VIEW sin builder también para hacer scrollable la pantalla.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesMealsProvider);
    final isMealFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritesMealsProvider.notifier)
                  .addFavoriteMeal(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded ? 'Meal Added as favorite' : 'Meal Unadded',
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(
                milliseconds: 890,
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                alignment: Alignment.centerLeft,
                turns: Tween<double>(
                  begin: 0.5,
                  end: 1,
                ).animate(animation),
                child: child,
              ),
              child: Icon(
                isMealFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isMealFavorite),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //FadeInImage(
          //  placeholder: MemoryImage(kTransparentImage),
          //  image: NetworkImage(meal.imageUrl),
          //  fit: BoxFit.fill,
          //  height: 200,
          //  width: double.infinity,
          //),
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'INGREDIENTS',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 14,
          ),
          for (String ingredient in meal.ingredients)
            Text(
              ingredient,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 20,
          ),
          Text(
            'STEPS',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 14,
          ),
          for (String step in meal.steps)
            Text(
              step,
              style: meal.steps.indexOf(step) % 2 == 0
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.error)
                  : Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryFixed),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
