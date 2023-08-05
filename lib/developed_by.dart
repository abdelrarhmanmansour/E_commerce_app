import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'core/constants.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
             Center(
              child: Text(
                "Developers Information",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            VerticalSpace(2),
            ListTile(
              leading: Icon(
                Icons.chevron_right_rounded,
                color: KGC,
              ),
              title: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Abdelrahman Mansour',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.chevron_right_rounded,
                color: KGC,
              ),
              title: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Abdelrahman Ashraf',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.chevron_right_rounded,
                color: KGC,
              ),
              title: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Ismail Fathy',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.chevron_right_rounded,
                color: KGC,
              ),
              title: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Mohamed Fathy',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
