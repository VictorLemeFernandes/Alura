import 'package:first_project/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task(
              'Aprender Flutter no café da manhã comendo pão',
              'assets/mascoteFlutter.png',
              3),
          Task(
              'Andar de bicicleta',
              'assets/bicicleta.jpg',
              2),
          Task(
              'Meditar',
              'assets/meditar.jpeg',
              5),
          SizedBox(
            height: 80,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
