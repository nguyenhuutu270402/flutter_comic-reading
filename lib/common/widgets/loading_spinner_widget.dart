import 'package:flutter/material.dart';

class LoadingSpinnerWidget extends StatefulWidget {
  @override
  _LoadingSpinnerWidgetState createState() => _LoadingSpinnerWidgetState();
}

class _LoadingSpinnerWidgetState extends State<LoadingSpinnerWidget> {
  bool _isLoading = false;

  void showLoadingSpinnerWidget() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoadingSpinnerWidget() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
