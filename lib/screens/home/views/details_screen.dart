import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:item_repo/item_repository.dart';

class DetailsScreen extends StatelessWidget {
  final Items items;
  const DetailsScreen({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                    items.picture,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('COLLECTION:${items.collection}',
                            style: GoogleFonts.roadRage(
                                textStyle: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow))),
                      ],
                    ),
                    Text(
                      'NAME: ${items.name}',
                      style: GoogleFonts.roadRage(
                        textStyle: TextStyle(
                            letterSpacing: 3,
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 226, 19, 19)),
                      ),
                    ),
                    Text(
                      'SIZE: ${items.size}',
                      style: GoogleFonts.roadRage(
                        textStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(237, 0, 0, 0)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              elevation: 3.0,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              '\$${items.price}.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
