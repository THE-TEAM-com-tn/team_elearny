import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'expandable_detail_component_model.dart';
export 'expandable_detail_component_model.dart';

class ExpandableDetailComponentWidget extends StatefulWidget {
  const ExpandableDetailComponentWidget({Key? key}) : super(key: key);

  @override
  _ExpandableDetailComponentWidgetState createState() =>
      _ExpandableDetailComponentWidgetState();
}

class _ExpandableDetailComponentWidgetState
    extends State<ExpandableDetailComponentWidget> {
  late ExpandableDetailComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpandableDetailComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FFTheme.of(context).secondaryBackground,
        ),
        child: Container(
          width: double.infinity,
          color: FFTheme.of(context).secondaryBackground,
          child: ExpandableNotifier(
            initialExpanded: false,
            child: ExpandablePanel(
              header: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Icon(
                      Icons.sticky_note_2_outlined,
                      color: FFTheme.of(context).primaryText,
                      size: 24,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'jhhrgpny' /* Product Detail */,
                    ),
                    style: FFTheme.of(context).bodyText1,
                  ),
                ],
              ),
              collapsed: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FFTheme.of(context).secondaryBackground,
                ),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'eydp9ud7' /* Lorem ipsum dolor sit amet, co... */,
                  ),
                  style: FFTheme.of(context).bodyText2,
                ),
              ),
              expanded: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '92a3xkeo' /* Lorem ipsum dolor sit amet, co... */,
                    ),
                    style: FFTheme.of(context).bodyText2,
                  ),
                ],
              ),
              theme: ExpandableThemeData(
                tapHeaderToExpand: true,
                tapBodyToExpand: false,
                tapBodyToCollapse: false,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                hasIcon: true,
                expandIcon: Icons.chevron_right_rounded,
                collapseIcon: Icons.keyboard_arrow_down_rounded,
                iconSize: 24,
                iconColor: FFTheme.of(context).secondaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
