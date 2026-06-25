import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Tarefa {
  String titulo;
  bool concluida;

  Tarefa({required this.titulo, this.concluida = false});
}

class ListaDeTarefas extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;
  
  void adicionarTarefa(String titulo) {
    if (titulo.trim().isNotEmpty) {
      _tarefas.add(Tarefa(titulo: titulo));
      notifyListeners(); 
    }
  }

class TarefasApp extends StatelessWidget {
  const TarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Tela1Page(),
        title: 'Gerenciador de Tarefas',
  );
  }}

     
class _Tela1PageState extends State<Tela1Page>{
 final TextEditingController tarea1Controller = TextEditingController();
 final TextEditingController resultadoController = TextEditingController();
   
   String resultado = "";

    void _adicionar() {
    tarea1.adicionarTarefa(resultado.text);
    resultado.clear();
  }

 //void mostrar (){
  //String tare1 = string.parse
 //}

    //setState((){
      //resultado = tarea1 + tarea2 ;});}
      
@override 
Widget build (BuildContext context){
  return 
}


}