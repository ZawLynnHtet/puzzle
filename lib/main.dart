import 'package:flutter/material.dart';
import 'utli/constant.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Puzzle(title: 'Flutter Demo Home Page'),
    );
  }
}

class Puzzle extends StatefulWidget {
  const Puzzle({super.key, required String title});

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  List puzzleNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  String? answer;
  int puzzleNo = 5;
  var imgOne = 3;
  var imgTwo = 5;
  var imgThree = 8;
  var imgFour = 1;
  int score = 0;
  double width = 0;
  Color messageBgColor = Colors.green;
  AudioPlayer player = AudioPlayer();


  void randomFun() {
    puzzleNumbers.shuffle();

    setState(() {
      imgOne = puzzleNumbers[0];
      imgTwo = puzzleNumbers[1];
      imgThree = puzzleNumbers[2];
      imgFour = puzzleNumbers[3];

      List puzzleNums = [imgOne, imgTwo, imgThree, imgFour];
      puzzleNums.shuffle();
      puzzleNo = puzzleNums[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: Icon(
            Icons.menu,
            color: textColor,
          ),
        ),
        title: Text(
          "Puzzle",
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 10,
              color: Colors.yellow,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Score : $score",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "Choose correct answer of $puzzleNo",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {
                            if (imgOne == puzzleNo) {
                              answer = 'correct';
                              score += 1;
                              width += 10;
                              messageBgColor = Colors.green;
                              player.play(AssetSource("audio/win.wav"));
                            } else {
                              answer = 'incorrect';
                              messageBgColor = Colors.red;
                              player.play(AssetSource("lose.wav"));
                            }
                            setState(() {});

                            randomFun();

                            var snackBar = SnackBar(
                              content: Text(answer!),
                              duration: const Duration(seconds: 1),
                              backgroundColor: messageBgColor,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Image.asset(
                            "images/$imgOne.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {
                            if (imgTwo == puzzleNo) {
                              answer = 'correct';
                              score += 1;
                              width += 10;
                              messageBgColor = Colors.green;
                              player.play(AssetSource("win.wav"));
                            } else {
                              answer = 'incorrect';
                              messageBgColor = Colors.red;
                              player.play(AssetSource("lose.wav"));
                            }
                            setState(() {});
                            randomFun();

                            var snackBar = SnackBar(
                              content: Text(answer!),
                              duration: const Duration(seconds: 1),
                              backgroundColor: messageBgColor,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Image.asset(
                            "images/$imgTwo.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {
                            if (imgThree == puzzleNo) {
                              answer = 'correct';
                              score += 1;
                              width += 10;
                              messageBgColor = Colors.green;
                              player.play(AssetSource("win.wav"));
                            } else {
                              answer = 'incorrect';
                              messageBgColor = Colors.red;
                              player.play(AssetSource("lose.wav"));
                            }
                            setState(() {});
                            randomFun();

                            var snackBar = SnackBar(
                              content: Text(answer!),
                              duration: const Duration(seconds: 1),
                              backgroundColor: messageBgColor,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Image.asset(
                            "images/$imgThree.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          splashColor: splashColor,
                          onTap: () {
                            if (imgFour == puzzleNo) {
                              answer = 'correct';
                              score += 1;
                              width += 10;
                              messageBgColor = Colors.green;
                              player.play(AssetSource("win.wav"));
                            } else {
                              answer = 'incorrect';
                              messageBgColor = Colors.red;
                              player.play(AssetSource("lose.wav"));
                            }
                            setState(() {});
                            randomFun();

                            var snackBar = SnackBar(
                              content: Text(answer!),
                              duration: const Duration(seconds: 1),
                              backgroundColor: messageBgColor,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: Image.asset(
                            "images/$imgFour.png",
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          elevation: 20,
                          minimumSize: const Size(200, 40),
                        ),
                        onPressed: () {
                          setState(() {
                            score = 0;
                            width = 0;
                          });
                        },
                        child: const Text(
                          'Refresh',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
