import 'package:flutter/material.dart';

void main() {
  runApp(const TarefasApp());
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

  void alternarStatus(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
    notifyListeners();
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);
    notifyListeners();
  }
}

class TarefasApp extends StatelessWidget {
  const TarefasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaTarefas(),
    );
  }
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final ListaDeTarefas _gerenciador = ListaDeTarefas();
  final TextEditingController _controladorTexto = TextEditingController();

  void _adicionar() {
    _gerenciador.adicionarTarefa(_controladorTexto.text);
    _controladorTexto.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controladorTexto,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _adicionar(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _adicionar,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _gerenciador,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: _gerenciador.tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = _gerenciador.tarefas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        title: Text(
                          tarefa.titulo,
                          style: TextStyle(
                            decoration: tarefa.concluida
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: tarefa.concluida,
                          onChanged: (_) => _gerenciador.alternarStatus(index),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _gerenciador.removerTarefa(index),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
