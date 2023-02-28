import '../components/command_palette_widget.dart';
import '../components/user_crud_bottom_sheet_widget.dart';
import '../components/web_nav_widget.dart';
import '../flutter_utils/ff_charts.dart';
import '../flutter_utils/ff_icon_button.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import '../flutter_utils/ff_widgets.dart';
import '../flutter_utils/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FFModel {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    webNavModel.dispose();
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
