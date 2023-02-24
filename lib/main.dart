import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(MaterialAppCustom()); //Inicia la app
}

class MaterialAppCustom extends StatelessWidget {
  const MaterialAppCustom();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoList(), //La página proncipal va a ser ToDoList
    );
  }
}

class ToDoList extends StatelessWidget {
  ToDoList({super.key});

  //tasks.map((e) => Container(child: Text("Hola"))).toList()

  List<Task> tasks = TaskFactory().generateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 226, 246),
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.check),
            tooltip: 'Lista de tareas',
            onPressed: null,
          ),
          backgroundColor: Color.fromARGB(255, 219, 33, 243),
          title: const Text("Lista de tareas"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              children: tasks
                  .map((task) => Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 236, 65, 248)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          //Row alinea los elementos de izquierda a derecha
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, //espacio dentro de los elementos de la fila Row
                          children: [
                            IconButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MaterialAppCustom2(task))),
                                icon: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.pink,
                                )),
                            Text(task.name()),
                            task.status()
                                ? const Icon(
                                    Icons.check_box,
                                    color: Colors.pink,
                                  ) //EEJEMPLO IF AIMPLIFICADO
                                : const Icon(
                                    Icons.check_box_outline_blank_outlined,
                                    color: Colors.pink,
                                  ),
                          ],
                        ),
                      ))
                  .toList()),
        ));
  }
}

class MaterialAppCustom2 extends StatelessWidget {
  Task _task;

  MaterialAppCustom2(this._task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 226, 246),

        //Selecciona toda la pantalla!
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 219, 33, 243),
          title: Text("Tarea: ${_task.name()}"),
        ),
        body: Center(
          child: Container(

              //EL QUE CONTIENE TODOS LOS ELEMENTOS
              margin: EdgeInsets.all(20),
              child: Center(
                child: Row(children: [
                  //DOS FILAS PARA SEPARAR EL NOMBRE Y EL VALOR
                  Container(
                    //PRIMERA COLUMNA
                    margin:
                        EdgeInsets.only(right: 10), //separacion entre columnas
                    child: Column(
                        //PRIMERA FILA (PARA FORMAR LAS COLUMNAS)

                        children: [
                          Container(
                            //FECHA DE INICIO
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: 135,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.date_range),
                                  const Text("Fecha de Inicio:   "),
                                ]),
                          ),
                          Container(
                            // FECHA DE FIN
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: 135,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.date_range),
                                  Text("Fecha Fin:   "),
                                ]),
                          ),
                          Container(
                            //ESTADO
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            width: 135,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _task.status()
                                      ? const Icon(Icons
                                          .check_box) //EEJEMPLO IF AIMPLIFICADO
                                      : const Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  Text("Estado:   "),
                                ]),
                          )
                        ]), //TERMINA LA PRIMERA COLUMNA
                  ),
                  Container(
                    child: Column(
                        //EMPIEZA LA SEGUNDA COLUMNA
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //VALOR DE LA FECHA DE INICIO
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(" ${_task.initialDate()}"),
                                ]),
                          ),
                          Container(
                            // VALOR DE LA FECHA DE FIN
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("  ${_task.endDate()}"),
                                ]),
                          ),
                          Container(
                            //VALOR DEL ESTADO
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 50,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 216, 237),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _task.status()
                                      ? const Text("  Finalizada")
                                      : const Text("  Pendiente")
                                ]),
                          )
                        ]),
                  )
                ]),
              )),
        ));
  }
}
