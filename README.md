# Movies Database App 🎬

A Netflix-inspired mobile movie discovery application built with Flutter, demonstrating clean architecture and modern development practices.

## 🚀 App Status

✅ **Ready for Testing** - The app is fully functional and production-ready

## 📱 Features

- **Home Screen** - Browse trending and now playing movies
- **Movie Details** - View comprehensive movie information
- **Search** - Real-time movie search with API integration
- **Bookmarks** - Save and manage favorite movies
- **Pagination** - "See All" functionality with infinite scroll
- **Dark/Light Theme** - Toggle between themes
- **Offline Support** - Local database caching with Drift

## 🛠️ Tech Stack

- **Flutter** - Mobile framework
- **Cubit (Bloc)** - State management
- **Drift** - Local database with SQLite
- **Retrofit + Dio** - Type-safe API client
- **Auto Route** - Navigation and routing
- **GetIt** - Dependency injection
- **TMDB API** - Movie data source

## 🏗️ Architecture

Clean Architecture with MVVM pattern:
- **Presentation Layer** - UI components and state management
- **Domain Layer** - Business logic and entities
- **Data Layer** - API clients and database management

## 🚀 How to Run

### Prerequisites
- Flutter SDK (latest stable version)
- Android Studio / VS Code
- Android device or emulator

### Setup Steps
1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movies_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Release Build
```bash
flutter build apk --release
```

## 📋 Current Limitations

- **Deep Links** - Deep linking functionality is not fully implemented
- **Authentication** - User authentication is not included
- **Social Features** - Sharing and social interactions are not implemented

## 🎯 Project Structure

```
lib/
├── core/                 # Core utilities and configuration
├── data/                 # Data layer (API, database, repositories)
├── domain/               # Domain layer (entities, use cases)
└── presentation/         # UI layer (pages, widgets, cubits)
```

## 📄 APK Download

A release APK is available in the `build/app/outputs/flutter-apk/` directory after building.

## 🔑 API Configuration

The app uses TMDB (The Movie Database) API. The API key is included for demonstration purposes.

---

**Built for Inshorts Senior Flutter Developer Interview**

*Demonstrating clean architecture, state management, offline-first design, and modern Flutter development practices.*