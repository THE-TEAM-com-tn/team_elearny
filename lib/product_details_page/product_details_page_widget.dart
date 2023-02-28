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
import 'product_details_page_model.dart';
export 'product_details_page_model.dart';

class ProductDetailsPageWidget extends StatefulWidget {
  const ProductDetailsPageWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageWidgetState createState() =>
      _ProductDetailsPageWidgetState();
}

class _ProductDetailsPageWidgetState extends State<ProductDetailsPageWidget>
    with TickerProviderStateMixin {
  late ProductDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FFTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: FFTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  '0xkir2p8' /* My Team */,
                ),
                style: FFTheme.of(context).title1,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.webNavModel,
                updateCallback: () => setState(() {}),
                child: WebNavWidget(
                  selectedPage: 2,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1170,
                    ),
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).primaryBackground,
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Container(
                                        width: 200,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: FFTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            context.pop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_rounded,
                                            color: FFTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xboikvmh' /* Product Details */,
                                            ),
                                            style: FFTheme.of(context)
                                                .title2,
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50, 8, 24, 0),
                                          child: badges.Badge(
                                            badgeContent: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gkip8pkp' /* 3 */,
                                              ),
                                              style:
                                                  FFTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FFTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FFTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                            showBadge: true,
                                            shape: badges.BadgeShape.circle,
                                            badgeColor:
                                                FFTheme.of(context)
                                                    .primaryColor,
                                            elevation: 4,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            position:
                                                badges.BadgePosition.topEnd(),
                                            animationType:
                                                badges.BadgeAnimationType.scale,
                                            toAnimate: true,
                                            child: FFIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              buttonSize: 48,
                                              icon: Icon(
                                                Icons.shopping_cart_outlined,
                                                color:
                                                    FFTheme.of(context)
                                                        .secondaryText,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 44, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '656ff3qv' /* Welcome to your company dashbo... */,
                                        ),
                                        style: FFTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Hero(
                                      tag: 'mainImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child:  Image.asset(
                                          'assets/images/ufpbn_1.jpg',
                                          width: double.infinity,
                                          height: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 0, 4),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ffup8jiv' /* Category Name */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FFTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FFTheme.of(context)
                                                    .bodyText1Family,
                                            color: FFTheme.of(context)
                                                .secondaryColor,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FFTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'pc1pxiwm' /* Detailed Product */,
                                      ),
                                      style:
                                          FFTheme.of(context).title1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        's3u2hi6x' /* $2,400 */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FFTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 16, 8),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'iao892x2' /* Lorem ipsum dolor sit amet, co... */,
                                      ),
                                      style: FFTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                  Divider(
                                    height: 24,
                                    thickness: 2,
                                    color: FFTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 8),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FFTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: FFTheme.of(context)
                                            .secondaryBackground,
                                        child: ExpandableNotifier(
                                          initialExpanded: false,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 12, 0),
                                                  child: Icon(
                                                    Icons
                                                        .sticky_note_2_outlined,
                                                    color: FFTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u6zfuly4' /* Product Detail */,
                                                  ),
                                                  style: FFTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                            collapsed: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color:
                                                    FFTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'e2i6oln9' /* Lorem ipsum dolor sit amet, co... */,
                                                ),
                                                style:
                                                    FFTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4o40i18y' /* Lorem ipsum dolor sit amet, co... */,
                                                  ),
                                                  style: FFTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon:
                                                  Icons.chevron_right_rounded,
                                              collapseIcon: Icons
                                                  .keyboard_arrow_down_rounded,
                                              iconSize: 24,
                                              iconColor:
                                                  FFTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  wrapWithModel(
                                    model:
                                        _model.expandableDetailComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: ExpandableDetailComponentWidget(),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 24),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FFTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: FFTheme.of(context)
                                            .secondaryBackground,
                                        child: ExpandableNotifier(
                                          initialExpanded: false,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 12, 0),
                                                  child: Icon(
                                                    Icons
                                                        .local_shipping_outlined,
                                                    color: FFTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y2ientzf' /* Shipping Information */,
                                                  ),
                                                  style: FFTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                            collapsed: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color:
                                                    FFTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '37qm4gd9' /* Lorem ipsum dolor sit amet, co... */,
                                                ),
                                                style:
                                                    FFTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'm9v17q0h' /* Lorem ipsum dolor sit amet, co... */,
                                                  ),
                                                  style: FFTheme.of(
                                                          context)
                                                      .bodyText2,
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon:
                                                  Icons.chevron_right_rounded,
                                              collapseIcon: Icons
                                                  .keyboard_arrow_down_rounded,
                                              iconSize: 24,
                                              iconColor:
                                                  FFTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FFTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x320F1113),
                                    offset: Offset(0, -2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 34),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FFTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(12),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: FFTheme.of(context)
                                              .primaryBackground,
                                          width: 2,
                                        ),
                                      ),
                                      child: FFCountController(
                                        decrementIconBuilder: (enabled) => Icon(
                                          Icons.remove_rounded,
                                          color: enabled
                                              ? FFTheme.of(context)
                                                  .secondaryText
                                              : FFTheme.of(context)
                                                  .secondaryText,
                                          size: 16,
                                        ),
                                        incrementIconBuilder: (enabled) => Icon(
                                          Icons.add_rounded,
                                          color: enabled
                                              ? FFTheme.of(context)
                                                  .primaryColor
                                              : FFTheme.of(context)
                                                  .secondaryText,
                                          size: 16,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FFTheme.of(context)
                                              .subtitle1,
                                        ),
                                        count: _model.countControllerValue ??=
                                            1,
                                        updateCount: (count) => setState(() =>
                                            _model.countControllerValue =
                                                count),
                                        stepSize: 1,
                                        minimum: 1,
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'n7twc7nt' /* Add to Cart */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 160,
                                        height: 50,
                                        color: FFTheme.of(context)
                                            .primaryColor,
                                        textStyle: FFTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily:
                                                  FFTheme.of(context)
                                                      .subtitle2Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FFTheme.of(
                                                                  context)
                                                              .subtitle2Family),
                                            ),
                                        elevation: 2,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
