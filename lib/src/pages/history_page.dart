import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi_app/src/data/models/trip_model.dart';
import 'package:taxi_app/src/widgets/trip_tile_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../data/providers/remote/trip_provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int labelIndex = 0;
  List<String> labels = ['REQUESTED', 'FINISHED', 'ACCEPTED', 'CANCELED'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Trip History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Center(
          child: Text("Trips History"),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 24),
            ToggleSwitch(
            minWidth: MediaQuery.of(context).size.width / 3,
            initialLabelIndex: labelIndex,
            totalSwitches: 4,
            labels: labels,
            onToggle: (index) {
              setState(() {
                if (index != null)
                  labelIndex = index;
                else
                  labelIndex = 0;
              });
            },
          ),
            tripFilterWidget(labels[labelIndex]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(  
        onPressed: () {
          Navigator.pushNamed(context, '/add_trip');
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }

  Widget tripsData(String filter) {
    final tripProvider = GetIt.I<TripProvider>();
    return FutureBuilder(
      future: tripProvider.getAllTrips(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          print("snapshot ${snapshot.data}");
          final trips = snapshot.data as List<Trip>;
          final tripsFiltered = trips.where((trip) =>
                  trip.status == filter).toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: tripsFiltered.length,
            itemBuilder: (context, index) {
              return TripTileWidget(trip: tripsFiltered[index]);
            },
          );
        }
        return const Center(
          heightFactor: 5,
          child: CircularProgressIndicator(),
        );
      }
    );
    // return ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: history.length,
    //   itemBuilder: (context, index) {
    //     return TripTileWidget(trip: history[index]);
    //   },
    // );
  }

  Widget tripFilterWidget(String filter) {
    return Column(
      children: [tripsData(filter)],
    );
  }
}
