import 'package:flutter/material.dart';
import 'package:mobiteach_quiz/blocs/home_bloc.dart';
import 'package:mobiteach_quiz/models/word.dart';
import 'package:mobiteach_quiz/resources/app_colors.dart';
import 'package:mobiteach_quiz/resources/app_strings.dart';
import 'package:mobiteach_quiz/screens/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(AppStrings.homeScreen),
        ),
        body: StreamBuilder<List<Word>>(
          stream: _homeBloc.homeState,
          builder: (_, snap) {
            if (snap.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snap.data!.length,
                      itemBuilder: (_, index) {
                        return _wordCard(
                            word: snap.data![index].word,
                            translate: snap.data![index].translate,
                            image: snap.data![index].image,
                            color: AppColors.white);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(QuizScreen.route, arguments: snap.data);
                    },
                    child: const Text(AppStrings.startLesson),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  Widget _wordCard({required String word, required String translate, required String image, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(
            width: 2.0,
            color: AppColors.grey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 60.0,
              height: 30.0,
            ),
            const SizedBox(width: 60.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(word),
                const SizedBox(
                  height: 5.0,
                ),
                Text(translate),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_down),
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
