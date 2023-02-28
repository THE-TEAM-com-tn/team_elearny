import '../components/web_nav_widget.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SamplePageModel extends FFModel {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    webNavModel.dispose();
  }

  /// Additional helper methods are added here.

}
