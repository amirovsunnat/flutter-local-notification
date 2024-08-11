import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_notifications/notification_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home Screen",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationController.birMartalikXabarnomaKorsatish(
                    sarlavha: "Bir martalik",
                    matn: "Xabarnoma ko'rsatilmoqda....",
                    malumot: "malumot");
              },
              child: const Text(
                "Bir martalik xabarnoma",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationController.takroriyXabarnomaKorsatish(
                    sarlavha: "Takroriy xabarnoma",
                    matn: "Takroriy xabarnoma ko'rsatilmoqda....",
                    malumot: "takroriy xabarnoma malumoti");
              },
              child: const Text(
                "Takroriy xabarnoma",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationController.rejalashtirilganXabarnomaKorsatish(
                    date: DateTime.now().add(
                      const Duration(
                        seconds: 7,
                      ),
                    ),
                    sarlavha: "Rejalashtirilgan xabarnoma",
                    matn: "Rejalashtirilgan xabarnoma ko'rsatilmoqda....",
                    malumot: "Rejalashtirilgan xabarnoma malumoti");
              },
              child: const Text(
                "Rejalashtirilgan xabarnoma",
              ),
            ),
            TextButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Xabarnomani o'chirish"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text("Qaysi birini o'chirmoqchisiz?"),
                          CupertinoTextField(
                            controller: _idController,
                            placeholder: "ID kiriting",
                            keyboardType: TextInputType.number,
                            padding: const EdgeInsets.all(10),
                            clearButtonMode: OverlayVisibilityMode.editing,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text("Bekor qilish"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text("O'chirish"),
                          onPressed: () {
                            final String id = _idController.text;
                            // Add your delete logic here using the id
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Xabarnomani o'chirish"),
            ),
            TextButton(
              onPressed: () {
                NotificationController.hammaXabarnomalarniToxtatish();
              },
              child: const Text(
                "Hamma xabarnomalarni o'chirish",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
