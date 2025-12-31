import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLocale {
  static const String onboarding1_title = 'onboarding1_title';
  static const String onboarding1_description = 'onboarding1_description';
  static const String onboarding2_title = 'onboarding2_title';
  static const String onboarding2_description = 'onboarding2_description';
  static const String onboarding3_title = 'onboarding3_title';
  static const String onboarding3_description = 'onboarding3_description';
  static const String continue_button = 'continue_button';
  static const String get_started = 'get_started';

  // menu
  static const String home_menu = 'home_menu';
  static const String watchlater_menu = 'watchlater_menu';
  static const String settings_menu = 'settings_menu';

  // Watch Later Page
  static const String watch_later = 'watch_later';
  static const String remove_from_watch_later = 'remove_from_watch_later';
  static const String remove_confirm_message = 'remove_confirm_message';
  static const String cancel = 'cancel';
  static const String remove = 'remove';
  static const String removed = 'removed';
  static const String removed_message = 'removed_message';
  static const String no_description = 'no_description';
  static const String unknown = 'unknown';

  // Home Page
  static const String upcoming_movies = 'upcoming_movies';
  static const String top_rated_movies = 'top_rated_movies';
  static const String popular_movies = 'popular_movies';
  static const String see_all = 'see_all';
  static const String watch_now = 'watch_now';
  static const String watch_popular_movies = 'watch_popular_movies';
  static const String card_description = 'card_description';
  static const String welcome = 'welcome';
  static const String lets_watch_movie = 'lets_watch_movie';

  // Settings Page
  static const String settings = 'settings';
  static const String preferences = 'preferences';
  static const String security = 'security';
  static const String about = 'about';
  static const String language = 'language';
  static const String theme = 'theme';
  static const String app_lock = 'app_lock';
  static const String app_lock_description = 'app_lock_description';
  static const String version = 'version';
  static const String select_language = 'select_language';
  static const String english = 'english';
  static const String arabic = 'arabic';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String app_lock_enabled = 'app_lock_enabled';
  static const String app_lock_enabled_desc = 'app_lock_enabled_desc';
  static const String got_it = 'got_it';

  // Search Page
  static const String search = 'search';
  static const String search_placeholder = 'search_placeholder';
  static const String search_clear_all = 'search_clear_all';
  static const String last_search = 'last_search';
  static const String search_page_text = 'search_page_text';
  static const String search_not_found = 'search_not_found';

  static const String movie_details_language = 'movie_details_language';
  static const String movie_details_release_date = 'movie_details_release_date';
  static const String movie_details_is_adults = 'movie_details_is_adults';
  static const String movie_details_description = 'movie_details_description';
  static const String movie_details_cast = 'movie_details_cast';
  static const String movie_details_see_more = 'movie_details_see_more';

  // auth

  static const String auth_title = 'auth_title';
  static const String auth_description = 'auth_description';
  static const String auth_error = 'auth_error';
  static const String auth_button_process = 'auth_button_process';
  static const String auth_button = 'auth_button';
    static const String auth_body = 'auth_body';

  

  static final List<MapLocale> LOCALES = [
     MapLocale(
      'en',
      {
        'home_menu': 'Home',
        'watchlater_menu': 'Watch Later',
        'settings_menu': 'Settings',
        'onboarding1_title': 'Discover Amazing Movies',
        'onboarding1_description': 'Browse through thousands of movies and find your next favorite film',
        'onboarding2_title': 'Create Your Watchlist',
        'onboarding2_description': 'Save movies you want to watch later and never miss a great film',
        'onboarding3_title': 'Get Personalized Recommendations',
        'onboarding3_description': 'Discover movies tailored to your taste and preferences',
        'continue_button': 'Continue',
        'get_started': 'Get Started',
        
        // Watch Later
        'watch_later': 'Watch Later',
        'remove_from_watch_later': 'Remove from Watch Later?',
        'remove_confirm_message': 'Are you sure you want to remove "%s" from your watch later list?',
        'cancel': 'Cancel',
        'remove': 'Remove',
        'removed': 'Removed!',
        'removed_message': '%s has been removed from your watch later list.',
        'no_description': 'No description available',
        'unknown': 'Unknown',
        
        // Home
        'upcoming_movies': 'Upcoming Movies',
        'top_rated_movies': 'Top Rated Movies',
        'popular_movies': 'Popular Movies',
        'see_all': 'See All',
        'watch_now': 'Watch Now',
        'watch_popular_movies': 'Watch popular\nmovies 1917',
        'card_description': 'Lorem ipsum dolor sit amet,\nconsectetur adipisci elit',
        'welcome': 'Welcome!',
        'lets_watch_movie': 'Let\'s watch a movie',
        
        // Settings
        'settings': 'Settings',
        'preferences': 'Preferences',
        'security': 'Security',
        'about': 'About',
        'language': 'Language',
        'theme': 'Theme',
        'app_lock': 'App Lock',
        'app_lock_description': 'Require authentication to open app',
        'version': 'Version',
        'select_language': 'Select Language',
        'english': 'English',
        'arabic': 'العربية',
        'light': 'Light',
        'dark': 'Dark',
        'app_lock_enabled': 'App Lock Enabled',
        'app_lock_enabled_desc': 'Your app is now protected with biometric authentication.',
        'got_it': 'Got it',
        
        // Search
        'search': 'Search',
        'search_placeholder': 'Search...',
        'search_clear_all':'Clear All',
        'last_search': 'Last Searches',
        'search_page_text': 'Search for Movies ...',
        'search_not_found': 'No results found',

        // Movie Details
        'movie_details_language': 'Language',
        'movie_details_release_date': 'Release Date',
        'movie_details_is_adults': 'Adults',
        'movie_details_description': 'Description',
        'movie_details_cast': 'Cast',
        'movie_details_see_more': 'See More',


        //auth
        'auth_title': 'Authentication Required',
        'auth_description': 'Please authenticate to access the app.',
        'auth_error': 'Authentication Failed. Please try again.',
        'auth_button_process': 'Authenticating...',
        'auth_button': 'Authenticate',
        'auth_body': 'Use your fingerprint or face recognition to unlock the app.',
      },
    ),
    MapLocale(
      'ar',
      const { 
        'home_menu': 'الرئيسية',
        'watchlater_menu': 'قائمة المشاهدة',
        'settings_menu': 'الإعدادات',
        'onboarding1_title': 'اكتشف أفلامًا رائعة',
        'onboarding1_description': 'تصفح آلاف الأفلام واعثر على فيلمك المفضل التالي',
        'onboarding2_title': 'أنشئ قائمة المشاهدة',
        'onboarding2_description': 'احفظ الأفلام التي تريد مشاهدتها لاحقًا ولا تفوت أي فيلم رائع',
        'onboarding3_title': 'احصل على توصيات مخصصة',
        'onboarding3_description': 'اكتشف أفلامًا مصممة خصيصًا لذوقك وتفضيلاتك',
        'continue_button': 'متابعة',
        'get_started': 'ابدأ الآن',
        
        // Watch Later
        'watch_later': 'المشاهدة لاحقًا',
        'remove_from_watch_later': 'إزالة من المشاهدة لاحقًا؟',
        'remove_confirm_message': 'هل أنت متأكد أنك تريد إزالة "%s" من قائمة المشاهدة لاحقًا؟',
        'cancel': 'إلغاء',
        'remove': 'إزالة',
        'removed': 'تمت الإزالة!',
        'removed_message': 'تمت إزالة %s من قائمة المشاهدة لاحقًا.',
        'no_description': 'لا يوجد وصف متاح',
        'unknown': 'غير معروف',
        
        // Home
        'upcoming_movies': 'الأفلام القادمة',
        'top_rated_movies': 'الأفلام الأعلى تقييمًا',
        'popular_movies': 'الأفلام الشائعة',
        'see_all': 'عرض الكل',
        'watch_now': 'شاهد الآن',
        'watch_popular_movies': 'شاهد الأفلام\nالشائعة 1917',
        'card_description': 'لوريم إيبسوم دولور سيت أميت،\nكونسيكتيتور أديبيسكي إيليت',
        'welcome': 'مرحبا!',
        'lets_watch_movie': 'لنشاهد فيلم',
        
        // Settings
        'settings': 'الإعدادات',
        'preferences': 'التفضيلات',
        'security': 'الأمان',
        'about': 'حول',
        'language': 'اللغة',
        'theme': 'المظهر',
        'app_lock': 'قفل التطبيق',
        'app_lock_description': 'طلب المصادقة لفتح التطبيق',
        'version': 'الإصدار',
        'select_language': 'اختر اللغة',
        'english': 'English',
        'arabic': 'العربية',
        'light': 'فاتح',
        'dark': 'داكن',
        'app_lock_enabled': 'تم تفعيل قفل التطبيق',
        'app_lock_enabled_desc': 'تطبيقك الآن محمي بالمصادقة البيومترية.',
        'got_it': 'حسنًا',
        
        // Search
        'search': 'البحث',
        'search_placeholder': 'ابحث...',
        'search_clear_all':'مسح الكل',
        'last_search': 'عمليات البحث الأخيرة',
        'search_page_text': 'ابحث عن أفلام ...',
        'search_not_found': 'لم يتم العثور على نتائج',

        // Movie Details
        'movie_details_language': 'اللغة',
        'movie_details_release_date': 'تاريخ الإصدار',
        'movie_details_is_adults': 'للبالغين',
        'movie_details_description': 'الوصف',
        'movie_details_cast': 'الممثلون',
        'movie_details_see_more': 'عرض المزيد',


        // auth
        'auth_title': 'المصادقة مطلوبة',
        'auth_description': 'يرجى المصادقة للوصول إلى التطبيق.',
        'auth_error': 'فشلت المصادقة. حاول مرة أخرى.',
        'auth_button_process': 'جاري المصادقة...',
        'auth_button': 'المصادقة',
        'auth_body': 'استخدم بصمة إصبعك أو التعرف على الوجه لفتح التطبيق.',

      },
    ),
  ];
}
