# Movies Database App 🎬
I have used LLM while creating this project.

A Netflix-inspired mobile movie discovery application built with Flutter, demonstrating clean architecture and modern development practices.

## 🚀 App Status

✅ **Ready for Testing** - The app is fully functional.

## 🔗 Quick Links

| Resource | Link | Description |
|----------|------|-------------|
| 📱 **APK Download** | **[Google Drive APK](https://drive.google.com/drive/folders/140k7__HbBK8NGILjycpKB2Hls2a47t0A?usp=drive_link)** | Production release (22.9 MB) |
| 🎥 **Demo Video** | **[Google Drive Video](https://drive.google.com/drive/folders/140k7__HbBK8NGILjycpKB2Hls2a47t0A?usp=drive_link)** | Complete app walkthrough |
| 📂 **Source Code** | **[GitHub Repository](https://github.com/iamsumitmandloi/movies_app)** | Full source code |

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

2. **Get TMDB API Key**
   - Visit [TMDB API](https://www.themoviedb.org/settings/api)
   - Create an account and get your API key
   - Note: A placeholder is set for demonstration

3. **Configure API Key (Optional)**
   ```bash
   # Option 1: Set environment variable
   export TMDB_API_KEY="your_actual_api_key_here"
   
   # Option 2: Use --dart-define flag
   flutter run --dart-define=TMDB_API_KEY=your_actual_api_key_here
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

6. **Run the app**
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

### Local Build
A release APK is available in the `build/app/outputs/flutter-apk/` directory after building.

### Google Drive Download
📱 **[Download APK from Google Drive](YOUR_GOOGLE_DRIVE_APK_LINK_HERE)**
- File: `movies_app_release.apk`
- Size: 22.9 MB
- Version: Production Ready

## 🎥 App Demo Video

🎬 **[Watch App Demo Video](YOUR_GOOGLE_DRIVE_VIDEO_LINK_HERE)**
- Complete app walkthrough
- All features demonstrated
- Production build showcase

## 🔑 API Configuration

The app uses TMDB (The Movie Database) API. For security:
- API key is loaded from environment variables
- A placeholder is set for demonstration purposes
- Get your API key from: https://www.themoviedb.org/settings/api

---

**Built for Inshorts Senior Flutter Developer Interview**

*Demonstrating clean architecture, state management, offline-first design, and modern Flutter development practices.*
