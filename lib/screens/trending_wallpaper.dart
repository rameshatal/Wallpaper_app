import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_131/bloc/wallpaper_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> selectedColors = [
    Colors.pink,
    Colors.grey,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.blue,
    Colors.red,
    Colors.black,
    Colors.orange,
  ];
  @override
  void initState() {
    super.initState();
    context.read<WallpaperBloc>().add(GetTrendingWallpaper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // backgroundColor: Color(0xff8BA2A6),
            ),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find Wallpaper..",
                        suffixIcon: Icon(Icons.search_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best of the month",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Expanded(
              child: Container(
                height: 200,
                child: BlocBuilder<WallpaperBloc, WallpaperState>(
                  builder: (context, state) {
                    if (state is WallpaperLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if(state is WallpaperInterErrorState){
                      return Center(child: Text(state.errorMsg,style: TextStyle(fontWeight: FontWeight.bold),),);
                    }
                    else if (state is WallpaperErrorState) {
                      return Center(child: Text(state.errorMsg),
                      );
                    } else if (state is WallpaperLoadedState) {
                      return ListView.builder(
                        itemCount: state.wallpaperModel.photos!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var eachWallpaper = state
                              .wallpaperModel.photos![index].src!.portrait!;
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(eachWallpaper),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(11)),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "The color tone",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 11,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: selectedColors[index],
                      borderRadius: BorderRadius.circular(11),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 150,
              width: double.infinity,
              child: GridView.builder(
                itemCount: 20,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1417325600/photo/riding-on-an-escalator-in-a-shopping-mall.jpg?b=1&s=170667a&w=0&k=20&c=SiekbjsSF3KL271a2U2wK8qWD2PtcrHjtYEMFXPqh84='),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(11)),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.orange,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(icon: Icon(Icons.window), label: "window"),
            NavigationDestination(
                icon: Icon(Icons.download), label: "download"),
            NavigationDestination(icon: Icon(Icons.person), label: "person"),
          ],
        ));
  }
}
