import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/models/place_model.dart';
import 'package:taxi_app/src/data/providers/remote/place_provider.dart';

import '../widgets/place_tile_widget.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final PlaceProvider placeProvider = GetIt.I<PlaceProvider>();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 2',
    'Ironman 3',
    'Ironman 4',
    'Ironman 5',
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: placeProvider.getAllPlaces(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          final places = snapshot.data!
              .where((e) =>
                  (e as Place).name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (() => Navigator.pushNamed(context, 'trip',
                      arguments: {'Place': places[index]})),
                  child: PlaceTileWidget(place: places[index]));
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: placeProvider.getAllPlaces(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          final places = snapshot.data!
              .where((e) =>
                  (e as Place).name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (() => Navigator.pushNamed(context, 'trip',
                      arguments: {'Place': places[index]})),
                  child: PlaceTileWidget(place: places[index]));
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }



  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias que aparecen cuando la persona escribe

  //   final listaSugerida = ( query.isEmpty )
  //                           ? peliculasRecientes
  //                           : peliculas.where(
  //                             (p)=> p.toLowerCase().startsWith(query.toLowerCase())
  //                           ).toList();

  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //           showResults( context );
  //         },
  //       );
  //     },
  //   );
  // }

}
