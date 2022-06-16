import 'package:flutter/material.dart';
import 'package:taxi_app/src/models/trip.dart';
import 'package:taxi_app/src/services/trip_history.dart';
import 'package:taxi_app/src/widgets/trip_tile_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int labelIndex = 0;
  List<String> labels = ['Finished', 'In Progress', 'Cancelled'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Trip History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: ToggleSwitch(
            minWidth: MediaQuery.of(context).size.width / 3,
            initialLabelIndex: labelIndex,
            totalSwitches: 3,
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
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TripFilterWidget(labels[labelIndex]),
          ],
        ),
      ),
    );
  }

  Widget tripsData(String filter) {
    final List<Trip> history = getHistory(filter);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: history.length,
      itemBuilder: (context, index) {
        return TripTileWidget(trip: history[index]);
      },
    );
  }

  TripFilterWidget(String filter) {
    return Column(
      children: [tripsData(filter)],
    );
  }
}
