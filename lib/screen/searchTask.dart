import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_example/const/colors.dart';
import 'package:todo_example/model/historyModel.dart';
import 'package:todo_example/provider/searchProvider.dart';
import 'package:uuid/uuid.dart';

class Searchtask extends StatelessWidget {
  const Searchtask({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final SearchProvider _searchProvider = Provider.of<SearchProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BACKGROUND_COLOR,
          title: TextField(
            controller: _controller,
            showCursor: true,
            decoration: InputDecoration(
              hintText: '검색',
              hintStyle: S20W600_GREY,
            ),
          ),
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('필터', style: S14W500_GREY_600),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            RenderFilterButton(text: 'done'),
                            RenderFilterButton(text: 'tomorrow'),
                            RenderFilterButton(text: 'yesterday'),
                            RenderFilterButton(text: '2 days left'),
                            RenderFilterButton(text: 'next week'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('검색 기록', style: S14W500_GREY_600),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (content, index) {
                            return RenderHistoryButton(
                                history: _searchProvider.searchData[index]);
                          },
                          itemCount: _searchProvider.searchData.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery.of(context).viewInsets.bottom + 100.0,
          child: Column(
            children: [
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  _searchProvider.addSearchHistory(History(
                    id: Uuid().v4(),
                    content: 'Hello world #${Random().nextInt(100)}',
                    date: DateTime.now(),
                  ));
                  print("+1 clicked");
                },
                child: Icon(Icons.plus_one),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// About History
class RenderHistoryButton extends StatelessWidget {
  final History history;

  const RenderHistoryButton({required this.history, super.key});

  @override
  Widget build(BuildContext context) {
    final SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    return GestureDetector(
      onTap: () {
        print("search button clicked");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
        child: AnimatedContainer(
          duration: Duration(microseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(history.content, style: S14W500_BLACK),
                ),
                const SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    searchProvider.removeSearchHistory(history.id);
                    print("${history.content} deleted");
                  },
                  child: Icon(
                    Icons.close,
                    size: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// About Filter
class RenderFilterButton extends StatefulWidget {
  final String text;

  const RenderFilterButton({required this.text, super.key});

  @override
  State<RenderFilterButton> createState() => _RenderFilterButtonState();
}

class _RenderFilterButtonState extends State<RenderFilterButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
        child: AnimatedContainer(
          duration: Duration(microseconds: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              border: Border.all(
                  color: isClicked ? Colors.blue : Colors.black, width: 0.5)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: isClicked ? Colors.blue : Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
