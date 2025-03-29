import 'dart:math';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    var rnd = Random();
    return Scaffold(
      appBar: AppBar(
        title: const Text('product_list'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.deepOrange,
        ),
        body: myGrid(context),
    );
  }

  Widget myContainer(BuildContext context) {
    return Container(
          width: 350,
          height: 500,
          color: const Color.fromARGB(255, 219, 219, 219),
          margin: const EdgeInsets.all(50),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://picsum.photos/id/200/300',
              fit: BoxFit.contain,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: (){
                  Navigator.pushNamed(context,'/ptd_dt',
                  arguments: {'uri':'https://picsum.photos/200/300',},);
                },
              child: const Text(' Detail ',style: TextStyle(color: Colors.white),),),
            ],
          ),
        );
  }

    Widget myGrid(BuildContext context) {
    return  GridView.builder(
      itemCount: 15,
      padding: const EdgeInsets.all(10),
      gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ), 
      itemBuilder: (ctx, index) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildTile(ctx,(index+1), (Random().nextInt(200) + 50)) ,
      ),
    );
  }

  Widget buildTile (BuildContext ctx ,int index, int price) => GridTile(
    footer: GridTileBar(
      backgroundColor: Colors.black,
      title: Text('Item No: $index'),
      subtitle: Text('Price: $price'),
      trailing: InkWell(
        child: const Icon(Icons.zoom_in, size: 32,color: Colors.white,),
        onTap: ()=> {
          Navigator.pushNamed(ctx, '/ptd_dt',
          arguments:{'id':index, 'price':price} 
          )
        },
      ),

    ),
    child: Image.network('https://picsum.photos/id/${index*9}/1000', 
    fit: BoxFit.cover,));

}