import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../screens/add_place_screen.dart";
import "../providers/great_places.dart";

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var places = Provider.of<GreatPlaces>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
            ? const Center(
                child: Text("Got no places yet, start adding some!"),
              )
            : ListView.builder(
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {},
                ),
                itemCount: greatPlaces.items.length,
              ),
      ),
    );
  }
}
