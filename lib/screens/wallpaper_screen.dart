import 'package:flutter/material.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nature",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
              Text(
                "36 Wallpaper available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 11,),
          Expanded(
            child: GridView.builder(
                itemCount: 36,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  childAspectRatio: 2/3,
                ), itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3LsOxOM787ZsTu0YW6TytibGzZ0yaeJfCKV8MIkxq&s'),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(11)
                    ),
                  );
                },),
          )
        ],
      ),
    );
  }
}
