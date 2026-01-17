# 🎬 Movies App


A modern Flutter application for browsing movies, integrated with **TMDB (The Movie Database) API**. 
 

---

## 📌 Features

- Browse **trending, popular, and top-rated movies** from TMDB.  
- **Movie details page**: overview, genres, release date, and more.  
- **Search movies** by title.  
- **Watch later** list with offline storage using Drift (SQLite).  
- **Localization**: English and Arabic.  
- **Theme switching**: Light & Dark.  
- **Animations**: Lottie, Flutter Animate, Shimmer.  
- **Secure storage**: Store sensitive preferences with `flutter_secure_storage`.  
- **Biometric authentication**: Fingerprint/Face ID with `local_auth`.  
- **Adaptive UI** for iOS using `adaptive_platform_ui`.  
---

## 🛠️ Packages Used

- **UI & Layout**: `adaptive_platform_ui`, `flutter_screenutil`, `google_fonts`, `flutter_svg`, `hugeicons`  
- **Animations & Loading**: `lottie`, `flutter_animate`, `skeletonizer`, `shimmer`  
- **State Management**: `flutter_bloc`, `freezed`, `freezed_annotation`, `get_it`  
- **Networking & API**: `dio`, `retrofit`, `retrofit_generator`, `pretty_dio_logger`  
- **Data & Storage**: `drift`, `drift_flutter`, `flutter_secure_storage`, `path_provider`  
- **Localization & Environment**: `flutter_localization`, `intl`, `flutter_dotenv`  
- **UI Dialogs**: `awesome_dialog`  
- **Authentication**: `local_auth`  

---

## 🚀 Installation

### Prerequisites

- **Flutter SDK 3.19+**
- **Dart 3.3+**
- **TMDB API Key** ([Get it here](https://www.themoviedb.org))
- **Android Studio / VS Code** with Flutter extensions
- **Git** for version control

### Step-by-Step Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/alharbisa24/movies_app.git
   cd movies_app
2. **Install Dependencies**
   ```bash
   flutter pub get
3. **Setup Environment Variables**
   ```bash
   API_TOKEN="" 
4. **Run the Application**
   ```bash
   flutter run

### Screenshots

## Onboarding1
![Onboarding1](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/dark_onboarding1.png)

## Onboarding2
![Onboarding2](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/dark_onboarding2.png)

## Onboarding3
![Onboarding3](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/dark_onboarding3.png)

## Authentication
![auth](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/dark_auth.png)

## Home
![home](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/dark_home.png)

## Change language
![changelang](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/change_language.png)

## Change Theme
![changetheme](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/light_change_theme.png)

## Search
![search](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/light_search.png)

## Movie Details
![Movie Details](https://raw.githubusercontent.com/alharbisa24/movies_app/master/assets/screenshots/light_moviedetails.png)
