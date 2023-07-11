import 'package:flutter/material.dart';

import 'difficulty.dart';

int retornaIndice(int nivel, int dificuldade) {
  int indice = 0;

  if (nivel > dificuldade * 10 && nivel < dificuldade * 20) {
    return indice + 1;
  } else if (nivel >= dificuldade * 20 && nivel < dificuldade * 30) {
    return indice + 2;
  } else {
    return indice + 3;
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 1, controleBarra = 0;
  Map<int, Color> colors = ({1: Colors.black, 2: Colors.green, 3: Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // CONTAINER WITH LINEAR PROGRESSION AND LEVEL
            Container(
              color: (nivel <= widget.dificuldade * 10)
                  ? Colors.blue
                  : colors[retornaIndice(nivel, widget.dificuldade)],
              height: 140,
            ),

            Column(
              children: [
                // CONTAINER WITH IMG, TXT AND BUTTON
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CONTAINER WITH ACTIVITY IMAGE
                      Container(
                        color: Colors.white,
                        width: 72,
                        height: 100,
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // NAME AND STARS
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ACTIVITY NAME
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),

                          // STARS
                          Difficulty(difficultyLevel: widget.dificuldade),
                        ],
                      ),

                      // INCREMENT BUTTON
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (controleBarra > widget.dificuldade * 10) {
                                  controleBarra = 0;
                                } else {
                                  controleBarra++;
                                }
                                nivel++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'Up',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),

                // PROGRESS ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white30,
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (controleBarra / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),

                    // LEVEL TEXT
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nível: $nivel',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
