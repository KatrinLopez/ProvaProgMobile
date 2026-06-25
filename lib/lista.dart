import 'package:flutter/material.dart';
import 'main.dart';

class Tela1 extends StatelessWidget{
    const Tela1 ({super.key});
}

@override
State<Tela1> createState() => _Tela1State ();

class _Tela1State extends State<Tela1> {
  final lista = ["tarea 1", "tarea 2"];

  @override
  Widget (buildBuildContext){
    return Scaffold(appBar: AppBar(
      title: Text("Lista de Tareas: "),
      backgroundColor: Colors.blueAccent,),
      body: ListView.builder(itemBuilder: itemCount: lista.length, itemBuilder: (ctx, index){
      return Card(elevattion: 20, 
      child:ListTitle(title: Text(
        lista[index]), 
        trailing:IconButton(onPressed:(){}, icon:Icon(Icons.delete)
        ),)); }) ); }}