import '../flutter_utils/ff_animations.dart';
import '../flutter_utils/ff_language_selector.dart';
import '../flutter_utils/ff_theme.dart';
import '../flutter_utils/ff_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_nav_model.dart';
export 'web_nav_model.dart';

class WebNavWidget extends StatefulWidget {
  const WebNavWidget({
    Key? key,
    int? selectedPage,
  })  : this.selectedPage = selectedPage ?? 1,
        super(key: key);

  final int selectedPage;

  @override
  _WebNavWidgetState createState() => _WebNavWidgetState();
}

class _WebNavWidgetState extends State<WebNavWidget>
    with TickerProviderStateMixin {
  late WebNavModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(115, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebNavModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
        tabletLandscape: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
        child: Container(
          width: 270,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FFTheme.of(context).background,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Image.asset(
                    'assets/images/theteam_light_logo.png',
                    width: 180,
                    height: 40,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'HomePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.selectedPage == 1
                            ? FFTheme.of(context).backgroundComponents
                            : FFTheme.of(context).background,
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 4,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: widget.selectedPage == 1
                                      ? FFTheme.of(context)
                                          .primaryColor
                                      : FFTheme.of(context).background,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.home_filled,
                              color: widget.selectedPage == 1
                                  ? FFTheme.of(context).primaryBtnText
                                  : FFTheme.of(context).grayStatic,
                              size: 28,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'tcr3k3e1' /* Dashboard */,
                                ),
                                style: FFTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FFTheme.of(context)
                                          .subtitle2Family,
                                      color: widget.selectedPage == 1
                                          ? FFTheme.of(context)
                                              .primaryBtnText
                                          : FFTheme.of(context)
                                              .grayStatic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FFTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed(
                        'UsersAndGroupPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.selectedPage == 2
                            ? FFTheme.of(context).backgroundComponents
                            : FFTheme.of(context).background,
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 4,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: widget.selectedPage == 2
                                      ? FFTheme.of(context)
                                          .primaryColor
                                      : FFTheme.of(context).background,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.group_rounded,
                              color: widget.selectedPage == 2
                                  ? FFTheme.of(context).primaryBtnText
                                  : FFTheme.of(context).grayStatic,
                              size: 28,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'tl4howcm' /* Users and Groups */,
                                ),
                                style: FFTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FFTheme.of(context)
                                          .subtitle2Family,
                                      color: widget.selectedPage == 2
                                          ? FFTheme.of(context)
                                              .primaryBtnText
                                          : FFTheme.of(context)
                                              .grayStatic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FFTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('ProductDetailsPage');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 4,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      FFTheme.of(context).background,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.library_books,
                              color: FFTheme.of(context).grayStatic,
                              size: 28,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'z3n85vrk' /* Training Details */,
                                ),
                                style: FFTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FFTheme.of(context)
                                          .subtitle2Family,
                                      color: FFTheme.of(context)
                                          .grayStatic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FFTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('SamplePage');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Container(
                                width: 4,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      FFTheme.of(context).background,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.wifi_tethering_rounded,
                              color: FFTheme.of(context).grayStatic,
                              size: 28,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '4yo5rc4g' /* Sample Page */,
                                ),
                                style: FFTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FFTheme.of(context)
                                          .subtitle2Family,
                                      color: FFTheme.of(context)
                                          .grayStatic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FFTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('SamplePage');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed('SettingsPage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Container(
                                  width: 4,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        FFTheme.of(context).background,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.settings,
                                color: FFTheme.of(context).grayStatic,
                                size: 28,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rrybpf0m' /* Settings */,
                                  ),
                                  style: FFTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: FFTheme.of(context)
                                            .subtitle2Family,
                                        color: FFTheme.of(context)
                                            .grayStatic,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FFTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 5),
                          child: FFLanguageSelector(
                            width: 200,
                            backgroundColor: Color(0xFF262D34),
                            borderColor:
                                FFTheme.of(context).grayStatic,
                            dropdownIconColor: Color(0xFF14181B),
                            borderRadius: 8,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                            hideFlags: false,
                            flagSize: 24,
                            flagTextGap: 8,
                            currentLanguage:
                                FFLocalizations.of(context).languageCode,
                            languages: FFLocalizations.languages(),
                            onChanged: (lang) => setAppLanguage(context, lang),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FFTheme.of(context)
                                  .backgroundComponents,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      setDarkModeSetting(
                                          context, ThemeMode.light);
                                    },
                                    child: Container(
                                      width: 115,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? FFTheme.of(context)
                                                .background
                                            : FFTheme.of(context)
                                                .backgroundComponents,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? FFTheme.of(context)
                                                  .background
                                              : FFTheme.of(context)
                                                  .backgroundComponents,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.wb_sunny_rounded,
                                            color: Theme.of(context)
                                                        .brightness ==
                                                    Brightness.light
                                                ? FFTheme.of(context)
                                                    .primaryBtnText
                                                : FFTheme.of(context)
                                                    .grayStatic,
                                            size: 16,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1rbvghow' /* Light Mode */,
                                              ),
                                              style: FFTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        FFTheme.of(
                                                                context)
                                                            .bodyText1Family,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? FFTheme.of(
                                                                context)
                                                            .primaryBtnText
                                                        : FFTheme.of(
                                                                context)
                                                            .grayStatic,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FFTheme.of(
                                                                    context)
                                                                .bodyText1Family),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      setDarkModeSetting(
                                          context, ThemeMode.dark);
                                    },
                                    child: Container(
                                      width: 115,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? FFTheme.of(context)
                                                .background
                                            : FFTheme.of(context)
                                                .backgroundComponents,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? FFTheme.of(context)
                                                  .background
                                              : FFTheme.of(context)
                                                  .backgroundComponents,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.nightlight_round,
                                            color: Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark
                                                ? FFTheme.of(context)
                                                    .primaryBtnText
                                                : FFTheme.of(context)
                                                    .grayStatic,
                                            size: 16,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5q6orxal' /* Dark Mode */,
                                              ),
                                              style: FFTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        FFTheme.of(
                                                                context)
                                                            .bodyText1Family,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? FFTheme.of(
                                                                context)
                                                            .primaryBtnText
                                                        : FFTheme.of(
                                                                context)
                                                            .grayStatic,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FFTheme.of(
                                                                    context)
                                                                .bodyText1Family),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation']!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 12,
                          thickness: 2,
                          color:
                              FFTheme.of(context).backgroundComponents,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1624561172888-ac93c696e10c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                  width: 44,
                                  height: 44,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '3zruxgmh' /* Admin D. */,
                                        ),
                                        style: FFTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily:
                                                  FFTheme.of(context)
                                                      .subtitle1Family,
                                              color:
                                                  FFTheme.of(context)
                                                      .primaryBtnText,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FFTheme.of(
                                                                  context)
                                                              .subtitle1Family),
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'k4j3ipm1' /* admin@gmail.com */,
                                        ),
                                        style: FFTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FFTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FFTheme.of(context)
                                                      .grayStatic,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FFTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'tr4sfb03' /* View Profile */,
                                          ),
                                          style: FFTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily:
                                                    FFTheme.of(context)
                                                        .bodyText2Family,
                                                color:
                                                    FFTheme.of(context)
                                                        .primaryColor,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FFTheme.of(
                                                                context)
                                                            .bodyText2Family),
                                              ),
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
