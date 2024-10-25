import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memobelc_front/src/core/core.dart';
import 'package:memobelc_front/src/modules/auth/infra/comm_packages/proto/pb/auth.pb.dart';
import 'package:memobelc_front/src/provider/shared_preferences.dart';
// import 'package:memobelc_front/src/modules/dashboard/presenter/pages/components/card_task.dart';

class TaskDashboard extends StatefulWidget {
  final LoginResponse? user;
  const TaskDashboard({super.key, required this.user});

  @override
  TaskDashboardState createState() => TaskDashboardState();
}

class TaskDashboardState extends State<TaskDashboard> {
  final taskController = TextEditingController();

  // final taskStore = Modular.get<TaskStore>();

  // @override
  // void initState() {
  //   super.initState();
  //   taskStore.getTasks(widget.user!.id);
  // }

  // @override
  // void dispose() {
  //   taskController.dispose();
  //   super.dispose();
  // }

  String greeting() {
    final current = DateTime.now();
    final hour = current.hour;

    if (hour >= 6 && hour < 12) {
      return "GOOD MORNING";
    } else if (hour >= 12 && hour < 18) {
      return "GOOD AFTERNOON";
    } else {
      return "GOOD EVENING";
    }
  }

  void _openAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Nome da Tarefa',
                  prefixIcon: Icon(Icons.task),
                ),
              ),
              const SizedBox(height: 10),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: () async {
                    if (taskController.text.isNotEmpty) {
                      print('add task');
                      // await taskStore.addTask(
                      //     taskController.text, widget.user!.id);
                      // await taskStore.getTasks(widget.user!.id);
                    }
                  },
                  child: const Text('Adicionar tarefa'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _reloadPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f9ae9),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(AppImages.logoPNG),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    color: Colors.yellow.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(1000, 80, 0, 0),
                      items: [
                        const PopupMenuItem(child: Text('Início')),
                        const PopupMenuItem(child: Text('Indique um amigo')),
                        const PopupMenuItem(child: Text('Configurações')),
                        PopupMenuItem(
                          child: const Text('Sair'),
                          onTap: () async {
                            await removeUserToken();
                            Modular.to.navigate(Modular.initialRoute);
                            
                          },
                        ),
                      ],
                    );
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/perfil.jpg'), // Imagem de perfil
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 40.0), // Padding maior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isMobile ? 10 : 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${greeting()}, ${widget.user!.name.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          letterSpacing: 2.0,
                          
                        ),
                      ),
                      const SizedBox(height: 16), // Espaçamento maior
                      const Text(
                        'New Day, New Hack!',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f9ae9),
                        ),
                      ),
                      const SizedBox(height: 24), // Espaçamento maior
                      ElevatedButton(
                        onPressed: () {
                          // Ação do botão de estudo
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 18, // Padding maior no botão
                            horizontal: 36, // Padding maior no botão
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Study Now',
                              style: TextStyle(fontSize: 18),
                              // Texto maior no botão
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isMobile)
                  const SizedBox(
                      width: 24), // Espaçamento maior entre coluna e card
                if (!isMobile)
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: MouseRegion(
                        onEnter: (_) {},
                        onExit: (_) {},
                        child: Stack(
                          children: [
                            // Carta "de trás" - adiciona uma sombra para parecer carta empilhada
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Transform.rotate(
                                angle: -0.05, // Pequena rotação
                                child: Container(
                                  width: 200,
                                  height: 240,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        offset: Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Carta "da frente"
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      'assets/images/logo_memobelc.jpg',
                                      fit: BoxFit.cover,
                                      height:
                                          140, // Aumento na altura da imagem
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        16.0), // Padding maior
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Master Deck',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20, // Texto maior
                                            color: Color(0xFF1f9ae9),
                                          ),
                                        ),
                                        const SizedBox(
                                            height: 12), // Espaçamento maior
                                        Row(
                                          children: [
                                            const Icon(Icons.style, size: 18),
                                            const SizedBox(
                                                width: 8), // Espaçamento maior
                                            const Text(
                                              '1000 out of 1200 to study',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Image.asset(
                                              'assets/images/flag.png',
                                              width: 26,
                                              height: 26,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (isMobile) // Card será exibido abaixo na versão mobile
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0), // Padding maior
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        16), // Ajuste para formato mais quadrado
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/logo_memobelc.jpg',
                          fit: BoxFit.cover,
                          height: 140, // Aumento na altura da imagem
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0), // Padding maior
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Master Deck',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, // Texto maior
                                color: Color(0xFF1f9ae9),
                              ),
                            ),
                            const SizedBox(height: 12), // Espaçamento maior
                            Row(
                              children: [
                                const Icon(Icons.style, size: 18),
                                const SizedBox(width: 8), // Espaçamento maior
                                const Text(
                                  '1000 out of 1200 to study',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Image.asset(
                                  'assets/images/flag.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
