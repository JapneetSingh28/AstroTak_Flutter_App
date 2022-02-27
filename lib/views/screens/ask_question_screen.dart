import 'package:astro_tak_flutter_app/views/widgets/circular_loading_view.dart';
import 'package:astro_tak_flutter_app/views/widgets/no_internet_view.dart';

import '../widgets/snack_bar.dart';
import '../widgets/tiles/question_tile.dart';
import '../widgets/textfields/sticky_textfield.dart';
import '../widgets/dropdowns/category_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../logic/bloc/ask_question_bloc/ask_question_bloc.dart';
import '../../utilities/constants.dart';
import '../../utilities/text_styles.dart';
import '../widgets/banners/bottom_banner.dart';
import '../widgets/qna_box_view.dart';
import '../widgets/banners/top_banner.dart';

class AskQuestionScreen extends StatefulWidget {
  static const String id = 'ask_question_screen';

  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  String selectedCategory = '';
  bool previousNoInternet = false;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AskQuestionBloc, AskQuestionState>(
          listener: (BuildContext context, Object? state) {
        if (state is AskQuestionNoInternetState) {
          previousNoInternet = true;
          ShowSnackBar().showSnackBar(context, 'Please connect to Internet.',
              backgroundColor: Colors.red);
        } else {
          if (previousNoInternet) {
            previousNoInternet = false;
            ShowSnackBar().showSnackBar(context, 'Back Online.',
                backgroundColor: Colors.green);
          }
        }
      }, builder: (context, state) {
        if (state is AskQuestionLoadedState) {
          if (selectedCategory == '') {
            selectedCategory = state.selectedCategoryData.name;
          }
          return Column(
            children: [
              const TopBanner(),
              Expanded(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                'Ask a Question',
                                style: heading,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                  'Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life,business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.'),
                              const SizedBox(height: 10),
                              Text('Choose Category', style: heading),
                              const SizedBox(height: 5),
                              CategoryDropDown(
                                  value: selectedCategory,
                                  itemsList: List<String>.from(state
                                      .allAskQuestionsData
                                      .map((tag) => tag.name)),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value ?? '';
                                    });
                                    BlocProvider.of<AskQuestionBloc>(context)
                                        .add(AskQuestionChangeCategoryEvent(
                                            categoryIndex: List<String>.from(
                                                    state
                                                        .allAskQuestionsData
                                                        .map((category) =>
                                                            category.name))
                                                .indexOf(selectedCategory),
                                            allAskQuestionsData:
                                                state.allAskQuestionsData));
                                    _textController.clear();
                                  }),
                            ],
                          ),
                        ),
                        SliverAppBar(
                          pinned: true,
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          floating: false,
                          bottom: const PreferredSize(
                            preferredSize: Size.fromHeight(100.0),
                            child: Text(''),
                          ),
                          flexibleSpace: StickyTextField(
                              textEditingController: _textController),
                        ),
                        if (state.selectedCategoryData.questionsList.isNotEmpty)
                          SliverToBoxAdapter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ideas what to Ask (Select Any)',
                                    style: heading)
                              ],
                            ),
                          ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => GestureDetector(
                              onTap: () {
                                _textController.text = state
                                    .selectedCategoryData.questionsList[index];
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                              child: QuestionTile(
                                  question: state.selectedCategoryData
                                      .questionsList[index]),
                            ),
                            childCount:
                                state.selectedCategoryData.questionsList.length,
                          ),
                        ),
                        const QnABoxView(),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: primaryColor,
                    child: const Icon(Icons.menu),
                  ),
                ),
              ),
              BottomBanner(
                categoryName: state.selectedCategoryData.name,
                price: state.selectedCategoryData.price.toInt(),
                onPressed: () {
                  if (_textController.text.trim().isEmpty) {
                    Fluttertoast.showToast(
                        msg: "First type your question",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        textColor: Colors.white,
                        fontSize: 15.0);
                  } else if (_textController.text.trim().length < 25) {
                    Fluttertoast.showToast(
                        msg: "Question length should be greater than 25",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        textColor: Colors.white,
                        fontSize: 15.0);
                  }
                },
              )
            ],
          );
        } else if (state is AskQuestionLoadingState) {
          return const CircularLoading();
        } else if (state is AskQuestionErrorState) {
          String error = state.errorMessage;
          return Center(child: Text(error));
        } else if (state is AskQuestionNoInternetState) {
          return const NoInternetView();
        } else {
          return const CircularLoading();
        }
      }),
    );
  }
}
