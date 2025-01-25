import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';

class Searchtask extends StatelessWidget {
  const Searchtask({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

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
            ],
          ),
        ),
      ),
    );
  }
}


// About History
class RenderHistoryButton extends StatefulWidget {
  final String text;

  const RenderHistoryButton({required this.text, super.key});

  @override
  State<RenderHistoryButton> createState() => _RenderHistoryButtonState();
}

class _RenderHistoryButtonState extends State<RenderHistoryButton> {
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
            child: Row(
              children: [
                Text(widget.text,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: isClicked ? Colors.blue : Colors.black,
                    )),
                GestureDetector(
                  onTap: () {
                    print("deleted clicked");
                  },
                  child: Icon(Icons.close, size: 15.0,),
                  // 수정 요망
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