import 'package:application/common/functions.dart';
import 'package:application/home/cubit/home_cubit.dart';
import 'package:application/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class OnGoingTripWidget extends StatefulWidget {
  final Order order;
  const OnGoingTripWidget({super.key, required this.order});

  @override
  State<OnGoingTripWidget> createState() => _OnGoingTripWidgetState();
}

class _OnGoingTripWidgetState extends State<OnGoingTripWidget> {
  double lat = 23.2398283;
  double long = 87.8668168;

  double latRes = 0.0;
  double lngRes = 0.0;

  double currentLocToResutrantMeters = 100;

  @override
  void initState() {
    super.initState();
    latRes = widget.order.restaurantLat;
    lngRes = widget.order.restaurantLng;
    lat = 23.2398283;
    long = 87.8668168;
    reduceDriverDistance(30);
  }

  void reduceDriverDistance(double meters) {
    var newLocation = moveTowards(lat, long, latRes, lngRes, meters);
    setState(() {
      lat = newLocation["latitude"]!;
      long = newLocation["longitude"]!;
    });

    
    double remaining = Geolocator.distanceBetween(lat, long, latRes, lngRes);

    //Genforce Check
    if (remaining <= 50) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Driver Arrived at Restaurant")));
      BlocProvider.of<HomeCubit>(context).onGoingTrip();
      return;
    }
    // Show remaining distance in console
    debugPrint("new Lat and Long: $lat and $long");
    Future.delayed(Duration(seconds: 10), () {
      reduceDriverDistance(30);
    });
  }

  void nextSteptoRestaurant() {
    lat = latRes;
    long = lngRes;
    BlocProvider.of<HomeCubit>(context).onGoingTrip();
  }

  Future<void> openDirections(double destLat, double destLng) async {
    final Uri googleUrl = Uri.parse(
      "https://www.google.com/maps/dir/?api=1&destination=$destLat,$destLng&travelmode=driving",
    );

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildOnGoingCard();
  }

  Widget buildOnGoingCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.money),
            const SizedBox(width: 10),
            Text(
              "₹ ${widget.order.amount}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFF34A853),
              ),
              child: Icon(Icons.check, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 5),
            Text(
              "Paid",
              style: TextStyle(
                color: Color(0xFF34A853),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.delivery_dining, color: Colors.red),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Driver Location",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.pin_drop, size: 16, color: Colors.red),
                    SizedBox(width: 6),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "${lat.toStringAsFixed(7)},${long.toStringAsFixed(7)}",
                      ),
                    ),
                    // Spacer(),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        openDirections(lat, long);
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: BoxBorder.all(color: Colors.blue),
                        ),
                        child: Icon(Icons.map, color: Colors.blue,size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.shopping_bag_outlined, color: Colors.red),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pickup Center-1",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Canteen C1, Khosbagan, Bardhaman, West Bengal 713103",
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "📍 ${latRes.toStringAsFixed(7)},${lngRes.toStringAsFixed(7)}",
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.phone, size: 16, color: Colors.red),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                openDirections(latRes, lngRes);
              },
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: BoxBorder.all(color: Colors.blue),
                ),
                child: Icon(Icons.map, color: Colors.blue, size: 20,),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Center(
          child: GestureDetector(
            onTap: () {
              nextSteptoRestaurant();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red.shade600,
              ),
              child: Text(
                "Arrived at Restaurant",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
