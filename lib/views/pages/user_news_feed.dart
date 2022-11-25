import 'package:flutter/material.dart';
import 'package:nightwatch/models/models.dart';
import 'package:nightwatch/services/navigation_and_dialog_service.dart';
import 'package:nightwatch/view_models/reports_view_model.dart';
import 'package:nightwatch/views/widgets/loading_dialog.dart';
import 'package:nightwatch/views/widgets/report_cards.dart';
import 'package:provider/provider.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late ReportsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<ReportsViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorService = context.read<NavigationAndDialogService>();
    return Consumer<ReportsViewModel>(
      builder: (context, reports, _) {
        switch (viewModel.state) {
          case ViewState.Idle:
          case ViewState.DataFetched:
                return ListView.builder(
                    itemCount: viewModel.reports.length,
                    itemBuilder: (context, index) {
                      if (viewModel.reports[index].isImminent) {
                        return ImminentCard(report: viewModel.reports[index]);
                      }
                      return NonImminentCard(report: viewModel.reports[index]);
                    });
          case ViewState.Busy:
            return const LoadingDialog(loadingMessage: "Retrieving Posts...");
          case ViewState.Error:
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigatorService.showSnackBar(viewModel.errorDialog);
            });
            return const LoadingDialog(
                loadingMessage: "Oops, something's wrong");
          default:
            return const Text(
              "Show an Illustration of no Reports",
              style: TextStyle(color: Colors.white),
            );
        }
      },
    );
  }
}
