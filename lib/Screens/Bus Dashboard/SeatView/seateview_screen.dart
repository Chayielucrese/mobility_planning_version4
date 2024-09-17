import 'package:flutter/material.dart';

class SeatViewPage extends StatelessWidget {
  const SeatViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat View', style: TextStyle(color:Colors.white)),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bus Details
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MUSANGO - BUEA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Musango Bus Service Co. Ltd.', style: TextStyle(fontSize: 14)),
                  Text('YDE - BUA M 001', style: TextStyle(color: Colors.grey)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('08:05 AM', style: TextStyle(color: Colors.red))),
                      Expanded(child: Text('DEPOT GUINNES', textAlign: TextAlign.center)),
                      Expanded(child: Text('1hr 0m', textAlign: TextAlign.center)),
                      Expanded(child: Text('MOTANGA DEPARTURE', textAlign: TextAlign.end)),
                    ],
                  ),
                  Text('31 Seats Available', style: TextStyle(color: Colors.grey)),
                  Text('FCFA 10,000.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Seat status legend
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSeatLegend(Colors.green, 'Available'),
                  SizedBox(height: 10),
                  _buildSeatLegend(Colors.red, 'Selected'),
                  SizedBox(height: 10),
                  _buildSeatLegend(Colors.grey, 'Booked'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Seat layout
            Container(
              height: MediaQuery.of(context).size.height * 0.4, // Adjusted height
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Seat layout
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (rowIndex) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(8, (seatIndex) {
                            int seatNumber = rowIndex * 8 + seatIndex + 1;
                            // For demonstration, assign random colors to seats
                            Color seatColor;
                            switch (seatIndex % 3) {
                              case 0:
                                seatColor = Colors.green; // Available
                                break;
                              case 1:
                                seatColor = Colors.red; // Selected
                                break;
                              default:
                                seatColor = Colors.grey; // Booked
                                break;
                            }
                            return Container(
                              margin: EdgeInsets.all(4),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: seatColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text('$seatNumber', style: TextStyle(color: Colors.white)),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Bottom section for boarding and dropping points
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Boarding Point',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Point A', 'Point B', 'Point C']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Dropping Point',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Point A', 'Point B', 'Point C']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: FCFA 0.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          // Handle continue action
                        },
                        child: Text('Continue'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // Button color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for seat legend
  Widget _buildSeatLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          color: color,
          width: 30,
          height: 30,
        ),
        SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
//8692c1b1fb894b2c8f91d023df033ff9