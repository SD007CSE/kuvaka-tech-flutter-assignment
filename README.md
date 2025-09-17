
# Flutter Driver App

A basic driver tracking application where the driver gets a job already assigned a basic app flow for a driver to pickup the order and deliver it to the customer.


## Documentation

Clone the project

```bash
  git clone https://link-to-project
```

Install dependencies

```bash
  flutter pub get
```

Start the app

```bash
  flutter run
```


For Code Design I have used following pattern
```bash
main.dart
\lib\common
        \common_button.dart
        \square_tile.dart
        \common_textfield.dart
     \functions.dart
    \home
        \cubit
            \home_cubit.dart
            \home_state.dart
        \pages
            \home_page.dart
        \widgets
            \arrived_at_restaurant.dart
            \home_widget.dart
            \ongoing_customer_widget.dart
            \ongoing_trip_widget.dart
    \login
        \pages
            \login.dart
        \widgets
            \login_widget.dart
    \models
        \order.dart
```

Reducing the distance of the driver to the location to 50 meters near the restaurant 

```bash
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
```

Open in Google Maps function

```bash
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
```
## Documentation

Clone the project

```bash
  git clone https://link-to-project
```

Install dependencies

```bash
  flutter pub get
```

Start the app

```bash
  flutter run
```


For Code Design I have used following pattern
```bash
main.dart
\lib\common
        \common_button.dart
        \square_tile.dart
        \common_textfield.dart
     \functions.dart
    \home
        \cubit
            \home_cubit.dart
            \home_state.dart
        \pages
            \home_page.dart
        \widgets
            \arrived_at_restaurant.dart
            \home_widget.dart
            \ongoing_customer_widget.dart
            \ongoing_trip_widget.dart
    \login
        \pages
            \login.dart
        \widgets
            \login_widget.dart
    \models
        \order.dart
```

Reducing distance of the driver till the driver comes near the location till 50 meters 

```bash
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
```

Open in Google Maps function

```bash
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
```

Video Link for the App: https://drive.google.com/drive/folders/1LQHBY5J1B9pXmWS1jtLxtlDq3lHo8_Bs?usp=sharing

Screeshots

1. Login pages

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/74ba58b4-fe9d-4d8c-8d9a-913b744fb733" />

2. Home Page

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/5f0b7b1e-9fd5-4312-bc88-bcf99647591e" />

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/c4612e6a-09b6-42a1-8ca0-d63c9eb5dec1" />

3. Arriving at the Restaurant State

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/0346fdc1-ca65-49c9-b79e-18df4c1e33b0" />

4. Arrived at the Restaurant State

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/88ec1d10-5d04-40f8-bcbe-b913fe9a8031" />

5. Starting the trip to the Customer

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/bfe63bfe-1165-4ec5-80c4-2ced4ea339e7" />

6. Final Order Delivered Page

<img width="581" height="1280" alt="image" src="https://github.com/user-attachments/assets/efe7b89e-5c35-4165-91d6-49af2d8d9352" />









