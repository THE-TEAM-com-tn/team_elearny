import '../flutter_utils/ff_animations.dart';
import '../flutter_utils/ff_expanded_image_view.dart';
import '../flutter_utils/ff_icon_button.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'training_details_page_model.dart';
export 'training_details_page_model.dart';

class TrainingDetailsPageWidget extends StatefulWidget {
  const TrainingDetailsPageWidget({Key? key}) : super(key: key);

  @override
  _TrainingDetailsPageWidgetState createState() =>
      _TrainingDetailsPageWidgetState();
}

class _TrainingDetailsPageWidgetState extends State<TrainingDetailsPageWidget>
    with TickerProviderStateMixin {
  late TrainingDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingDetailsPageModel());

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
              backgroundColor: FFTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FFIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 54,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FFTheme.of(context).secondaryText,
                  size: 24,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '984z0o9x' /* Training Details */,
                ),
                style: FFTheme.of(context).subtitle1,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FFTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x28000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 400,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FFExpandedImageView(
                                            image: Image.asset(
                                              'assets/images/ufpbn_1.jpg',
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: true,
                                            tag: 'surfLesson',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'surfLesson',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child:  Image.asset(
                                          'assets/images/ufpbn_1.jpg',
                                          width: double.infinity,
                                          height: 400,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 12),
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 4,
                                            sigmaY: 4,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color: Color(0x28000000),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 5,
                                                  color: Color(0x28000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '739t51yn' /* Training Session */,
                                                    ),
                                                    style: FFTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FFTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FFTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rs7cy6vn' /* $200.00 */,
                                                        ),
                                                        style:
                                                            FFTheme.of(
                                                                    context)
                                                                .title1
                                                                .override(
                                                                  fontFamily: FFTheme.of(
                                                                          context)
                                                                      .title1Family,
                                                                  color: FFTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FFTheme.of(context)
                                                                              .title1Family),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '819qf65r' /* Half Day Training */,
                                                            ),
                                                            style: FFTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily: FFTheme.of(
                                                                          context)
                                                                      .bodyText2Family,
                                                                  color: Color(
                                                                      0xFFC18213),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FFTheme.of(context)
                                                                              .bodyText2Family),
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.star_rounded,
                                                          color:
                                                              Color(0xFFC18213),
                                                          size: 24,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tywz1lvg' /* 5.0 */,
                                                          ),
                                                          style: FFTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily: FFTheme.of(
                                                                        context)
                                                                    .bodyText2Family,
                                                                color: Color(
                                                                    0xFFC18213),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FFTheme.of(context)
                                                                            .bodyText2Family),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 12, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gc1selpc' /* Training Details Page */,
                                ),
                                style: FFTheme.of(context).title3,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 16, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'z8ltzbib' /* Learn the basics of finding wh... */,
                                        ),
                                        style: FFTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'jih8eue9' /* Your Instructor */,
                        ),
                        style: FFTheme.of(context).title3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                              FFTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x28000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1602474457187-d43d18c88c6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3VyZmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'e870ay50' /* Randy Alcorn */,
                                        ),
                                        style: FFTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '186b97oq' /* 4 yrs exp */,
                                          ),
                                          style: FFTheme.of(context)
                                              .bodyText2,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FFTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'blu5a9ln' /* 5.0 */,
                                          ),
                                          style: FFTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily:
                                                    FFTheme.of(context)
                                                        .bodyText2Family,
                                                color:
                                                    FFTheme.of(context)
                                                        .tertiaryColor,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FFTheme.of(
                                                                context)
                                                            .bodyText2Family),
                                              ),
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: FFTheme.of(context)
                                              .tertiaryColor,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'fi98mvdp' /* More info */,
                        ),
                        style: FFTheme.of(context).title3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color:
                              FFTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x28000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1602474457187-d43d18c88c6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3VyZmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'dpvdfqhw' /* Randy Alcorn */,
                                        ),
                                        style: FFTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lww34d2x' /* 4 yrs exp */,
                                          ),
                                          style: FFTheme.of(context)
                                              .bodyText2,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: FFTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'kbapwrz5' /* 5.0 */,
                                          ),
                                          style: FFTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily:
                                                    FFTheme.of(context)
                                                        .bodyText2Family,
                                                color:
                                                    FFTheme.of(context)
                                                        .tertiaryColor,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FFTheme.of(
                                                                context)
                                                            .bodyText2Family),
                                              ),
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: FFTheme.of(context)
                                              .tertiaryColor,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ],
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
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: FFTheme.of(context).tertiaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x28000000),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              alignment: AlignmentDirectional(0, -0.44999999999999996),
              child: Text(
                FFLocalizations.of(context).getText(
                  'jzgv9iaj' /* Book Now */,
                ),
                style: FFTheme.of(context).title3.override(
                      fontFamily: FFTheme.of(context).title3Family,
                      color: FFTheme.of(context).primaryBtnText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FFTheme.of(context).title3Family),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
