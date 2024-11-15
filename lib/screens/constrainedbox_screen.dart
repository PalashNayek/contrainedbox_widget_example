import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/service_locator.dart';
import '../view_modes/constrainedbox_viewmodel.dart';

class ConstrainedBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<ConstrainedBoxViewModel>(),
      child: Consumer<ConstrainedBoxViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("ConstrainedBox with MVVM"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: viewModel.minWidth,
                      minHeight: viewModel.minHeight,
                      maxWidth: viewModel.maxWidth,
                      maxHeight: viewModel.maxHeight,
                    ),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          "Min: ${viewModel.minWidth}x${viewModel.minHeight}\n"
                              "Max: ${viewModel.maxWidth}x${viewModel.maxHeight}",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => viewModel.updateConstraints(
                          newMinWidth: 150, newMinHeight: 150),
                      child: Text("Min 150x150"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => viewModel.updateConstraints(
                          newMaxWidth: 250, newMaxHeight: 250),
                      child: Text("Max 250x250"),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => viewModel.updateConstraints(
                          newMinWidth: 100, newMinHeight: 100, newMaxWidth: 200, newMaxHeight: 200),
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
