import '../components/expandable_detail_component_widget.dart';
import '../components/web_nav_widget.dart';
import '../flutter_utils/ff_animations.dart';
import '../flutter_utils/ff_count_controller.dart';
import '../flutter_utils/ff_icon_button.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import '../flutter_utils/ff_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsPageModel extends FFModel {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for expandable_detail_component component.
  late ExpandableDetailComponentModel expandableDetailComponentModel;
  // State field(s) for CountController widget.
  int? countControllerValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    expandableDetailComponentModel =
        createModel(context, () => ExpandableDetailComponentModel());
  }

  void dispose() {
    webNavModel.dispose();
    expandableDetailComponentModel.dispose();
  }

  /// Additional helper methods are added here.

}
