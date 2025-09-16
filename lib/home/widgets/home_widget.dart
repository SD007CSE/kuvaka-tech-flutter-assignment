import 'package:application/components/widgets/square_tile.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //HEADING MESSAGE
                //
                Text(
                  "Orders",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                ),
                const SizedBox(height: 25),

                AnimatedContainer(
                  height: isExpanded ? MediaQuery.of(context).size.height-200 : 90,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  duration: Duration(milliseconds: 500),
                  child: _buildOrderCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Icon(Icons.delivery_dining, size: 50),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildOrderCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min ,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Order No."), Text("#1234")],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  "Pickup Pending",
                  style: TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),
            ],
          ),
          if (isExpanded) ...[
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person_outlined, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  "Jack Hammer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.phone, size: 16, color: Colors.red),
                ),
              ],
            ),

            const SizedBox(height: 20),
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
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Canteen C1, Khosbagan, Bardhaman, West Bengal 713103 (23.2372743,87.8637262)",
                      ),
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
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.messenger, size: 16, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SquareTile(imgPath: 'assets/images/ladoo1.png', height: 60),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        "Besan Ladoo",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("500g", style: TextStyle(color: Colors.grey[700])),
                      Row(
                        children: [
                          Text("Qty:", style: TextStyle(color: Colors.black)),
                          Text("2", style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.pin_drop_outlined, color: Colors.red),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Flat No. 5/x Nandani Complex, Ullash, Barddhaman, West Bengal, 71303 (23.2205411,87.8926756)",
                      ),
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
                  child: Icon(Icons.messenger, size: 16, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.money),
                const SizedBox(width: 10),
                Text(
                  "₹ 800",
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
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.only(
                // left: 8,
                top: 8,
                bottom: 10,
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Delivery Pickup By",
                            style: TextStyle(
                              color: Colors.red.shade400,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: SizedBox(
                              width: 150,
                              child: Text(
                                "Today 5:30 PM, Thu, 16/09/2025",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Colors.red),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timelapse, color: Colors.red),
                                const SizedBox(width: 5),
                                Text(
                                  "TIME LEFT",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "1:04 Hrs",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
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
          ],
        ],
      ),
    );
  }
}
