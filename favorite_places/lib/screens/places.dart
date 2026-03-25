import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/screens/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(placesProvider.notifier).loadPlaces();
  }

  void _goToPlace(Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => PlaceItemScreen(place),
      ),
    );
  }

  void _addPlace() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final availablePlaces = ref.watch(placesProvider);

    Widget content = Center(
      child: Text(
        'No places added yet',
        style: TextTheme.of(context).titleMedium,
      ),
    );

    if (availablePlaces.isNotEmpty) {
      content = FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: availablePlaces.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: FileImage(availablePlaces[index].image),
                  ),
                  onTap: () {
                    _goToPlace(availablePlaces[index]);
                  },
                  title: Text(
                    availablePlaces[index].name,
                    style: TextTheme.of(context).titleSmall,
                  ),
                  subtitle: Text(
                    availablePlaces[index].location.address,
                    style: TextTheme.of(context).titleSmall,
                  ),
                ),
              ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Places',
          style: TextTheme.of(context).titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: Icon(Icons.add_home_work_outlined),
          ),
        ],
      ),
      body: content,
    );
  }
}
