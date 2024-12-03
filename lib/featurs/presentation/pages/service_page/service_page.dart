import 'package:app_day/featurs/presentation/widgets/colors_app.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  final String serviceName, serviceId;

  const ServicePage(
      {super.key, required this.serviceId, required this.serviceName});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appActiveColor,
        title: Text(
          widget.serviceName,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),

        ),

        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.serviceName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
             "ID: ${widget.serviceId}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
