import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SamplePage
  {
    '402lhcmc': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'uh84oybp': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'fk3cx78u': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    '83b2417w': {
      'en': 'Sample Page',
      'fr': 'Page d\'exemple',
    },
  },
  // HomePage
  {
    'lmwf80xg': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
    'gniavulx': {
      'en': 'Command Palette',
      'fr': 'Palette de commandes',
    },
    'pb2jlkng': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    'zonvn7e9': {
      'en': 'Company Overview',
      'fr': 'Présentation de l\'entreprise',
    },
    'xf2p8tgv': {
      'en': 'Below is a summary of the activity of your company.',
      'fr':
          'Vous trouverez ci-dessous un récapitulatif de l\'activité de votre entreprise.',
    },
    'hyyc3pjl': {
      'en': '32k',
      'fr': '32k',
    },
    '0opqi0a6': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'lowxibm1': {
      'en': '32k',
      'fr': '32k',
    },
    'f919kxrk': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'e3uqr58c': {
      'en': '32k',
      'fr': '32k',
    },
    'x29aciqz': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'kkh0p8a4': {
      'en': '32k',
      'fr': '32k',
    },
    'anmfw0x7': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'w53q8ukp': {
      'en': '32k',
      'fr': '32k',
    },
    '8fu7hpsq': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'hhn3fky4': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'q6vu64l5': {
      'en': '32k',
      'fr': '32k',
    },
    'f2hzx2fa': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'epcwm0uy': {
      'en': '32k',
      'fr': '32k',
    },
    'ic15gfem': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'b4gvvuyt': {
      'en': '32k',
      'fr': '32k',
    },
    'gx5nqoxl': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'ktq409i0': {
      'en': '32k',
      'fr': '32k',
    },
    'qm9utja1': {
      'en': 'Education',
      'fr': 'Éducation',
    },
    'saoemfsa': {
      'en': '32k',
      'fr': '32k',
    },
    'wlc9tjly': {
      'en': 'Company Overview',
      'fr': 'Présentation de l\'entreprise',
    },
    '77qpzbo9': {
      'en': 'Below is a summary.',
      'fr': 'Ci-dessous un résumé.',
    },
    'e1gwjhjt': {
      'en': 'Course name',
      'fr': 'Nom du cours',
    },
    's6srxtoi': {
      'en': '# of students',
      'fr': '# des étudiants',
    },
    '4o142mqn': {
      'en': 'Next Class',
      'fr': 'Cours suivant',
    },
    'drftv8yb': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'cxhiqd4y': {
      'en': '1,625',
      'fr': '1 625',
    },
    '4zke5dqn': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '9s2abvfk': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'x8wsvto1': {
      'en': '1,625',
      'fr': '1 625',
    },
    'e0zq5yoi': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '2lx2goqe': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'pkhq3jqb': {
      'en': '1,625',
      'fr': '1 625',
    },
    'krbnrfwu': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '7ec0qqli': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'rznm644t': {
      'en': '1,625',
      'fr': '1 625',
    },
    'g1wsmu13': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '63d51nak': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    '5coolf7t': {
      'en': '1,625',
      'fr': '1 625',
    },
    'ae1p9zcm': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '0546eu06': {
      'en': 'Recent Activity',
      'fr': 'Activité récente',
    },
    'p0tqgnu2': {
      'en': 'Below is the summary of activity for the last 30 days.',
      'fr':
          'Vous trouverez ci-dessous le résumé de l\'activité des 30 derniers jours.',
    },
    'a0sdawa7': {
      'en': 'Company Overview',
      'fr': 'Présentation de l\'entreprise',
    },
    'clfyj3ei': {
      'en': 'Below is a summary.',
      'fr': 'Ci-dessous un résumé.',
    },
    '1tr17gue': {
      'en': 'Course name',
      'fr': 'Nom du cours',
    },
    'r40bfntd': {
      'en': '# of students',
      'fr': '# des étudiants',
    },
    'c00s0mft': {
      'en': 'Next Class',
      'fr': 'Cours suivant',
    },
    '0kv0bdri': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'x31uakvi': {
      'en': '1,625',
      'fr': '1 625',
    },
    'dryrrtvh': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    'o3y3kyli': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    '0dlow3wn': {
      'en': '1,625',
      'fr': '1 625',
    },
    'x6txotk3': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    'qft938kj': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'r0sn0bbz': {
      'en': '1,625',
      'fr': '1 625',
    },
    'igqiye6h': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    'klcbovs9': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'ellh206v': {
      'en': '1,625',
      'fr': '1 625',
    },
    '93612obt': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    'tp3ioj4x': {
      'en': '101 FF',
      'fr': '101 FF',
    },
    'dil419p6': {
      'en': '1,625',
      'fr': '1 625',
    },
    '0tlb40pl': {
      'en': 'Tues. 8th, 2022',
      'fr': 'You are. 8, 2022',
    },
    '8h36iayd': {
      'en': 'Recent Activity',
      'fr': 'Activité récente',
    },
    'xt2nyl0v': {
      'en': 'Below is the summary of activity for the last 30 days.',
      'fr':
          'Vous trouverez ci-dessous le résumé de l\'activité des 30 derniers jours.',
    },
    '8kwo6ih0': {
      'en': 'Card Header',
      'fr': 'En-tête de carte',
    },
    'onxggh7k': {
      'en': 'Create tables and ui elements that work below.',
      'fr':
          'Créez des tableaux et des éléments d\'interface utilisateur qui fonctionnent ci-dessous.',
    },
    'fj09rpxt': {
      'en': 'Search users...',
      'fr': 'Rechercher des utilisateurs...',
    },
    's4dvr3rb': {
      'en': 'Create User',
      'fr': 'Créer un utilisateur',
    },
    'w0auyo5n': {
      'en': 'ID',
      'fr': 'IDENTIFIANT',
    },
    '8v4hwj2h': {
      'en': 'User Information',
      'fr': 'informations de l\'utilisateur',
    },
    'xh610mtt': {
      'en': 'Next Task Due',
      'fr': 'Prochaine tâche due',
    },
    'bvzgxzac': {
      'en': 'Status',
      'fr': 'Statut',
    },
    '5926g2cd': {
      'en': 'Actions',
      'fr': 'Actions',
    },
    '46kug0h4': {
      'en': '#2422',
      'fr': '#2422',
    },
    'oqz4m13o': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'b0g44xqo': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'edunp4h9': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'obq06yqb': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'wbh7fwm3': {
      'en': '#2424',
      'fr': '#2424',
    },
    'qt7pd1a5': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'egx8f7t7': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'y13n91en': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    '3kejib1a': {
      'en': 'Active',
      'fr': 'Actif',
    },
    '3ouq9hpd': {
      'en': '#2452',
      'fr': '#2452',
    },
    'r7kejb8n': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    '3gikqsz5': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    '032zarro': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    '1i4uiutb': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'f0gq2t0l': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
    'p109m37w': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
  },
  // ProductDetailsPage
  {
    '0xkir2p8': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'xboikvmh': {
      'en': 'Product Details',
      'fr': 'détails du produit',
    },
    'gkip8pkp': {
      'en': '3',
      'fr': '3',
    },
    '656ff3qv': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    'ffup8jiv': {
      'en': 'Category Name',
      'fr': 'Nom de catégorie',
    },
    'pc1pxiwm': {
      'en': 'Detailed Product',
      'fr': 'Produit détaillé',
    },
    's3u2hi6x': {
      'en': '\$2,400',
      'fr': '2 400 \$',
    },
    'iao892x2': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
    },
    'u6zfuly4': {
      'en': 'Product Detail',
      'fr': 'Détail du produit',
    },
    'e2i6oln9': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    '4o40i18y': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'y2ientzf': {
      'en': 'Shipping Information',
      'fr': 'Informations sur la livraison',
    },
    '37qm4gd9': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    'm9v17q0h': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'n7twc7nt': {
      'en': 'Add to Cart',
      'fr': 'Ajouter au panier',
    },
    'ss6c31v0': {
      'en': 'Training Details',
      'fr': 'Détails de la formation',
    },
  },
  // UsersAndGroupPage
  {
    'hlpm3op4': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    '4yyctdin': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    '32qpgayo': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    'g2sja5q6': {
      'en': 'Users',
      'fr': 'Utilisateurs',
    },
    '4q57hiuj': {
      'en': 'Below are the members of your team.',
      'fr': 'Vous trouverez ci-dessous les membres de votre équipe.',
    },
    'b16ux8cr': {
      'en': 'Search users...',
      'fr': 'Rechercher des utilisateurs...',
    },
    '7x5iqm8q': {
      'en': 'Create User',
      'fr': 'Créer un utilisateur',
    },
    'fofz8j2o': {
      'en': 'ID',
      'fr': 'IDENTIFIANT',
    },
    '1pct0h4e': {
      'en': 'User Information',
      'fr': 'informations de l\'utilisateur',
    },
    'ugngnnro': {
      'en': 'Next Task Due',
      'fr': 'Prochaine tâche due',
    },
    'wtjkf5ue': {
      'en': 'Status',
      'fr': 'Statut',
    },
    'w6sgvkjj': {
      'en': 'Actions',
      'fr': 'Actions',
    },
    'hh3vfx5r': {
      'en': '#2422',
      'fr': '#2422',
    },
    'in6njj36': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    't1xjeu8g': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    't3jjn7s8': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'abe4j7f0': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'vajo2u8k': {
      'en': '#2424',
      'fr': '#2424',
    },
    's4rvq133': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'fjrd2cb9': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    '73vgtm8g': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    '5g3hfxcv': {
      'en': 'Active',
      'fr': 'Actif',
    },
    '1jefet9s': {
      'en': '#2424',
      'fr': '#2424',
    },
    'x9lhxyi2': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'ept9wd9w': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'z4zcbt78': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'zz6xxnvw': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'f2mfg6iu': {
      'en': '#2424',
      'fr': '#2424',
    },
    '31cqs21g': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'h8pmbwhx': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'vaxyl898': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'tjaehvmn': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'pkcgxur1': {
      'en': '#2452',
      'fr': '#2452',
    },
    'be8ey031': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'lrykcag0': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'vk5d6brg': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    '6m9mjocw': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'i40kyxhh': {
      'en': '#2452',
      'fr': '#2452',
    },
    'ptmbak1p': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'ittu3ia0': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    'qvyno5gs': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    '8nzn1tcd': {
      'en': 'Active',
      'fr': 'Actif',
    },
    'gr529wfo': {
      'en': '#2452',
      'fr': '#2452',
    },
    'g1dzuvca': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'mgazdusf': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    '2zj97aid': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'w15x3pan': {
      'en': 'Active',
      'fr': 'Actif',
    },
    '3mftt8qb': {
      'en': '#2452',
      'fr': '#2452',
    },
    '3k9nm75t': {
      'en': 'Randy Peterson',
      'fr': 'Randy Peterson',
    },
    'lm7ukewm': {
      'en': 'randy.p@domainname.com',
      'fr': 'randy.p@domainname.com',
    },
    '8uqg8zie': {
      'en': 'Jan. 30th, 2023',
      'fr': '30 janvier 2023',
    },
    'llu5cqms': {
      'en': 'Active',
      'fr': 'Actif',
    },
    '3zf7r35x': {
      'en': 'Users &',
      'fr': 'Utilisateurs &',
    },
  },
  // TrainingDetailsPage
  {
    '739t51yn': {
      'en': 'Training Session',
      'fr': 'Session de formation',
    },
    'rs7cy6vn': {
      'en': '\$200.00',
      'fr': '200,00 \$',
    },
    '819qf65r': {
      'en': 'Half Day Training',
      'fr': 'Demi-journée de formation',
    },
    'tywz1lvg': {
      'en': '5.0',
      'fr': '5.0',
    },
    'gc1selpc': {
      'en': 'Training Details Page',
      'fr': 'Page Détails de la formation',
    },
    'z8ltzbib': {
      'en':
          'Learn the basics of finding what you need to have in order to be able to cruise close to the sunset.',
      'fr':
          'Apprenez les bases pour trouver ce dont vous avez besoin pour pouvoir naviguer près du coucher du soleil.',
    },
    'jih8eue9': {
      'en': 'Your Instructor',
      'fr': 'Votre instructeur',
    },
    'e870ay50': {
      'en': 'Randy Alcorn',
      'fr': 'Randy Alcorn',
    },
    '186b97oq': {
      'en': '4 yrs exp',
      'fr': '4 ans exp',
    },
    'blu5a9ln': {
      'en': '5.0',
      'fr': '5.0',
    },
    'fi98mvdp': {
      'en': 'More info',
      'fr': 'Plus d\'informations',
    },
    'dpvdfqhw': {
      'en': 'Randy Alcorn',
      'fr': 'Randy Alcorn',
    },
    'lww34d2x': {
      'en': '4 yrs exp',
      'fr': '4 ans exp',
    },
    'kbapwrz5': {
      'en': '5.0',
      'fr': '5.0',
    },
    'jzgv9iaj': {
      'en': 'Book Now',
      'fr': 'Reserve maintenant',
    },
    '984z0o9x': {
      'en': 'Training Details',
      'fr': 'Détails de la formation',
    },
    'efravvjz': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LessonPage
  {
    'b1az816c': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'npnk05eb': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'kfacf3uz': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    'ul01347u': {
      'en': 'Hello World ',
      'fr': 'Bonjour le monde',
    },
    '87582tm5': {
      'en': 'Lesson',
      'fr': 'Leçon',
    },
  },
  // SettingsPage
  {
    'okxg2wp2': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    '9ldlumm9': {
      'en': 'My Team',
      'fr': 'Mon équipe',
    },
    'phivjzjs': {
      'en': 'Welcome to your company dashboard, review activity below.',
      'fr':
          'Bienvenue sur le tableau de bord de votre entreprise, consultez l\'activité ci-dessous.',
    },
    'lx1fbelp': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    'kzazlyrg': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
  },
  // commandPalette
  {
    'inlfhjp5': {
      'en': 'Search platform...',
      'fr': 'Plateforme de recherche...',
    },
    '0epzlxca': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    'qq4pod19': {
      'en': 'Quick Links',
      'fr': 'Liens rapides',
    },
    '0u44tc5t': {
      'en': 'Find Course',
      'fr': 'Trouver un cours',
    },
    'eodpkg4e': {
      'en': 'Find Student',
      'fr': 'Trouver un étudiant',
    },
    'cu3h4ypo': {
      'en': 'New Message',
      'fr': 'Nouveau message',
    },
    '12f1s2za': {
      'en': 'New Course',
      'fr': 'Nouveau cours',
    },
    'b87aj8pt': {
      'en': 'Recent Searches',
      'fr': 'recherches récentes',
    },
    'sf2uq7jc': {
      'en': 'Newport Grade 11',
      'fr': 'Newport 11e année',
    },
    'pqjh22s1': {
      'en': 'Harry Styles',
      'fr': 'Styles Harry',
    },
  },
  // webNav
  {
    'tcr3k3e1': {
      'en': 'Dashboard',
      'fr': 'Tableau de bord',
    },
    'tl4howcm': {
      'en': 'Users and Groups',
      'fr': 'Utilisateurs et groupes',
    },
    'z3n85vrk': {
      'en': 'Training Details',
      'fr': 'Détails de la formation',
    },
    '4yo5rc4g': {
      'en': 'Sample Page',
      'fr': 'Page d\'exemple',
    },
    'rrybpf0m': {
      'en': 'Settings',
      'fr': 'Paramètres',
    },
    '1rbvghow': {
      'en': 'Light Mode',
      'fr': 'Mode lumière',
    },
    '5q6orxal': {
      'en': 'Dark Mode',
      'fr': 'Mode sombre',
    },
    '3zruxgmh': {
      'en': 'Admin D.',
      'fr': 'Admin D',
    },
    'k4j3ipm1': {
      'en': 'admin@gmail.com',
      'fr': 'admin@gmail.com',
    },
    'tr4sfb03': {
      'en': 'View Profile',
      'fr': 'Voir le profil',
    },
  },
  // UserCrudBottomSheet
  {
    'e3fkawbj': {
      'en': 'User Settings',
      'fr': 'Paramètres utilisateur',
    },
    '66gh37ug': {
      'en': 'Subtitle for the needs of description',
      'fr': 'Sous-titre pour les besoins de la description',
    },
    '4wuna5g4': {
      'en': 'Share',
      'fr': 'Partager',
    },
    '95h0esu6': {
      'en': 'Get Link',
      'fr': 'Obtenir le lien',
    },
    'l5cshovu': {
      'en': 'Add',
      'fr': 'Ajouter',
    },
    '55b6gyy1': {
      'en': 'Edit',
      'fr': 'Modifier',
    },
    'cg9e4pqr': {
      'en': 'Delete',
      'fr': 'Supprimer',
    },
  },
  // expandable_detail_component
  {
    'jhhrgpny': {
      'en': 'Product Detail',
      'fr': 'Détail du produit',
    },
    'eydp9ud7': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
    },
    '92a3xkeo': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
  },
].reduce((a, b) => a..addAll(b));
