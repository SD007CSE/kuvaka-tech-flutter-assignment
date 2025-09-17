// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application/home/cubit/home_cubit.dart';
import 'package:application/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ArrivedAtRestaurantWidegt extends StatefulWidget {
  final Order orders;

  const ArrivedAtRestaurantWidegt({Key? key, required this.orders})
    : super(key: key);

  @override
  State<ArrivedAtRestaurantWidegt> createState() =>
      _ArrivedAtRestaurantWidegtState();
}

class _ArrivedAtRestaurantWidegtState extends State<ArrivedAtRestaurantWidegt> {
  double lat = 0.0;
  double long = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lat = widget.orders.restaurantLat;
    long = widget.orders.restaurantLng;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.money),
            const SizedBox(width: 10),
            Text(
              "₹ ${widget.orders.amount}",
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(height: 5),
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
                    GestureDetector(
                      onTap: () {
                        openDirections(lat, long);
                      },
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: BoxBorder.all(color: Colors.blue),
                        ),
                        child: Icon(Icons.map, color: Colors.blue, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.pin_drop_outlined, color: Colors.red, size: 16),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver at",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "Flat No. 5/x Nandani Complex, Ullash, Barddhaman, West Bengal, 71303",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        openDirections(widget.orders.customerLat, widget.orders.customerLng);
                      },
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: BoxBorder.all(color: Colors.blue),
                        ),
                        child: Icon(Icons.map, color: Colors.blue, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context).confirmPickup();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red.shade600,
                      ),
                      child: Text(
                        "Confirm Pickup",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
