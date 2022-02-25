import '../widgets/tiles/question_tile.dart';
import '../widgets/textfields/sticky_textfield.dart';
import '../widgets/dropdowns/tag_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../logic/bloc/ask_question_bloc/ask_question_bloc.dart';
import '../../utilities/constants.dart';
import '../../utilities/text_styles.dart';
import '../widgets/banners/bottom_banner.dart';
import '../widgets/qna_box.dart';
import '../widgets/banners/top_banner.dart';

class AskQuestionScreen extends StatefulWidget {
  static const String id = 'ask_question_screen';

  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  String sortValue = '';
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AskQuestionBloc, AskQuestionState>(
          builder: (context, state) {
        if (state is AskQuestionLoadedState) {
          if (sortValue == '') {
            sortValue = state.selectedTagData.name;
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
                              TagDropDown(
                                  value: sortValue,
                                  itemsList: List<String>.from(state
                                      .allAskQuestionsData
                                      .map((tag) => tag.name)),
                                  onChanged: (value) {
                                    setState(() {
                                      sortValue = value ?? '';
                                    });
                                    BlocProvider.of<AskQuestionBloc>(context)
                                        .add(AskQuestionFilterEvent(
                                            tagIndex: List<String>.from(state
                                                    .allAskQuestionsData
                                                    .map((tag) => tag.name))
                                                .indexOf(sortValue),
                                            allAskQuestionsData:
                                                state.allAskQuestionsData));
                                    _textController.clear();
                                  }),
                            ],
                          ),
                        ),
                        SliverStickyHeader(
                          header: StickyTextField(
                              textEditingController: _textController),
                          sliver: MultiSliver(
                            children: [
                              if (state
                                  .selectedTagData.questionsList.isNotEmpty)
                                SliverToBoxAdapter(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          .selectedTagData.questionsList[index];
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                    child: QuestionTile(
                                        question: state.selectedTagData
                                            .questionsList[index]),
                                  ),
                                  childCount: state
                                      .selectedTagData.questionsList.length,
                                ),
                              ),
                              const QnABox(),
                            ],
                          ),
                        ),
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
                tagName: state.selectedTagData.name,
                price: state.selectedTagData.price.toInt(),
                onPressed: () {
                  if (_textController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "First type your question",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        textColor: Colors.white,
                        fontSize: 15.0);
                  } else if (_textController.text.length < 25) {
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
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 1.0,
            ),
          );
        } else if (state is AskQuestionErrorState) {
          String error = state.errorMessage;
          return Center(child: Text(error));
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: primaryColor2,
              strokeWidth: 1.0,
            ),
          );
        }
      }),
    );
  }
}
