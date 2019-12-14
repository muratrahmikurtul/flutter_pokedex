import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokedex.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});


  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}



class _PokemonDetailState extends State<PokemonDetail> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation==Orientation.portrait){
            return dikeyBody(context);
          }else{
            return yatayBody(context);
          }
        }),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  widget.pokemon.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text("Height : " + widget.pokemon.height,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text("Weight : " + widget.pokemon.weight,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text("Types",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type
                      .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(tip),
                          ))
                      .toList(),
                ),
              Text("Pre Evolution",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.prevEvolution != null ?
                      widget.pokemon.prevEvolution.map((pre) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(pre.name),
                          ))
                      .toList(): [Text("This pokemon is in first shape", style: TextStyle(fontWeight: FontWeight.bold),)],
                ),                  
              Text("Next Evolution",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.nextEvolution != null ?
                      widget.pokemon.nextEvolution.map((evolution) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(evolution.name),
                          ))
                      .toList(): [Text("This pokemon can't evolve", style: TextStyle(fontWeight: FontWeight.bold),)],
                ),
              Text("Weakness",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.weaknesses != null ?
                      widget.pokemon.weaknesses.map((weak) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(weak),
                          ))
                      .toList(): [Text("This pokemon has no weakness", style: TextStyle(fontWeight: FontWeight.bold),)],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              width: 150,
              height: 120,
              child: Image.network(
                widget.pokemon.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-20,
      height: MediaQuery.of(context).size.height*(3/4),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                width: 200,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text("Height : " + widget.pokemon.height,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("Weight : " + widget.pokemon.weight,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("Types",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(tip),
                            ))
                        .toList(),
                  ),
                Text("Pre Evolution",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null ?
                        widget.pokemon.prevEvolution.map((pre) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(pre.name),
                            ))
                        .toList(): [Text("This pokemon is in first shape", style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),                  
                Text("Next Evolution",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null ?
                        widget.pokemon.nextEvolution.map((evolution) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(evolution.name),
                            ))
                        .toList(): [Text("This pokemon can't evolve", style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),
                Text("Weakness",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null ?
                        widget.pokemon.weaknesses.map((weak) => Chip(
                              backgroundColor: Colors.deepOrange.shade300,
                              label: Text(weak),
                            ))
                        .toList(): [Text("This pokemon has no weakness", style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }  
}
