import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  void getImage(File image) {
    _selectedImage = image;
  }

  void getLocation(PlaceLocation location) {
    _selectedLocation = location;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(
              height: 13,
            ),
            ImageInput(getImage),
            //IMAGE INPUT
            SizedBox(
              height: 13,
            ),
            LocationInput(
              onSelectLocation: getLocation,
            ),
            SizedBox(
              height: 13,
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(placesProvider.notifier).addPlace(Place(
                      name: _titleController.text,
                      image: _selectedImage!,
                      location: _selectedLocation!,
                    ));
                Navigator.of(context).pop();
              },
              label: Text('ADD Place'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
