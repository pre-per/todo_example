import 'package:flutter/material.dart';
import 'package:todo_example/const/colors.dart';

class Categorysetting extends StatelessWidget {
  const Categorysetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RenderCategoryAppBar(),
      backgroundColor: BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 0.15),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                RenderCategorySelectButton(text: '일상'),
                Divider(color: Colors.grey),
                RenderCategorySelectButton(text: '공부'),
                Divider(color: Colors.grey),
                RenderCategorySelectButton(text: '업무'),
                Divider(color: Colors.grey),
                RenderCategoryAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AppBar RenderCategoryAppBar() {
  return AppBar(
    backgroundColor: BACKGROUND_COLOR,
    title: Text('카테고리 선택', style: S20W600_BLACK),
  );
}

class RenderCategorySelectButton extends StatefulWidget {
  String text;

  RenderCategorySelectButton({required this.text, super.key});

  @override
  State<RenderCategorySelectButton> createState() =>
      _RenderCategorySelectButtonState();
}

class _RenderCategorySelectButtonState
    extends State<RenderCategorySelectButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon((_isSelected)
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked),
              SizedBox(width: 10.0),
              Icon(Icons.face),
              SizedBox(width: 10.0),
              Text(widget.text, style: S20W600_BLACK),
            ],
          ),
        ),
      ),
    );
  }
}

class RenderCategoryAddButton extends StatelessWidget {
  const RenderCategoryAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55.0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 10.0),
            Text('카테고리 추가', style: S20W600_BLACK),
          ],
        ),
      ),
    );
  }
}
