# YanaWay - Setup and Running Guide

## Quick Start 🚀

### 1. Prerequisites
Make sure you have:
- Flutter SDK installed (version 3.9.0 or higher)
- Android Studio / VS Code with Flutter extensions
- An Android emulator or iOS simulator running

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
# For Android
flutter run

# For iOS (Mac only)
flutter run -d ios

# For a specific device
flutter devices  # List all devices
flutter run -d <device-id>
```

### 4. Build for Production
```bash
# Android APK
flutter build apk

# Android App Bundle (for Play Store)
flutter build appbundle

# iOS (Mac only)
flutter build ios
```

## App Features Overview 🎯

### Screen Flow
1. **Login Screen** - Beautiful login interface with social auth options
2. **Home Screen** - Search for buses with route and date selection
3. **Booking Screen** - Browse available buses with details
4. **Seat Selection** - Interactive seat map with real-time availability
5. **Passenger Details** - Enter contact information and review booking
6. **Payment Screen** - Secure payment processing

### Key Features
- ✅ Fully functional UI matching Figma designs
- ✅ Interactive seat selection with color-coded states
- ✅ Date picker integration
- ✅ Price calculation and booking summary
- ✅ Smooth navigation between screens
- ✅ Modern Material Design 3 components

## Project Structure 📁

```
yanaway/
├── lib/
│   ├── main.dart              # App entry point
│   ├── models/
│   │   └── bus.dart          # Data models
│   ├── routes/
│   │   └── app_routes.dart   # Navigation routes
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── booking_screen.dart
│   │   ├── seat_selection_screen.dart
│   │   ├── passenger_details_screen.dart
│   │   └── payment_screen.dart
│   ├── theme/
│   │   └── app_theme.dart    # Colors, styles, fonts
│   └── widgets/              # Reusable widgets
├── pubspec.yaml              # Dependencies
└── README.md                 # Documentation
```

## Testing the App 🧪

### Manual Testing Flow
1. Launch the app → Login screen appears
2. Click "Login" button → Navigate to Home screen
3. Select origin (Colombo) and destination (Jaffna)
4. Pick a date → Search button becomes active
5. Click "Search" → View available buses
6. Click "BOOK" on a bus → Go to seat selection
7. Select seats → View booking summary
8. Enter passenger details → Proceed to payment
9. Complete payment → Success confirmation

### Interactive Features to Test
- ✅ Date picker functionality
- ✅ Swap button for routes
- ✅ Seat selection with different states
- ✅ Form validation
- ✅ Price calculations
- ✅ Navigation back button
- ✅ Bottom navigation bar

## Development Tips 💡

### Hot Reload
Press `r` in the terminal to hot reload changes instantly.

### Hot Restart
Press `R` to hot restart the app.

### Debug Mode
- Add `debugger();` statements in your code
- Use `print()` for console logging
- Use Flutter Inspector in VS Code/Android Studio

### Common Commands
```bash
# Check for errors
flutter analyze

# Format code
flutter format .

# Get dependencies
flutter pub get

# Clean build
flutter clean
flutter pub get

# Check device connection
flutter devices
```

## Customization 🎨

### Changing Colors
Edit `lib/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF0B95A4);
static const Color tealAccent = Color(0xFF0BCE97);
// ... modify colors
```

### Adding New Screens
1. Create screen file in `lib/screens/`
2. Add route in `lib/routes/app_routes.dart`
3. Update navigation in parent screens

### Modifying Bus Data
Edit `lib/models/bus.dart`:
```dart
static List<Bus> sampleBuses = [
  Bus(
    name: 'Your Bus Name',
    // ... add/modify fields
  ),
];
```

## Troubleshooting 🔧

### Issue: App won't run
**Solution:** 
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Missing dependencies
**Solution:**
```bash
flutter pub get
```

### Issue: SDK version conflict
**Solution:** Update Flutter
```bash
flutter upgrade
```

### Issue: Device not detected
**Solution:**
- Check device connection
- Enable USB debugging on Android
- Trust device on iPhone

## Next Steps 🎯

To make this production-ready:
1. Add backend API integration
2. Implement real authentication
3. Add real payment gateway
4. Store booking history locally
5. Add push notifications
6. Implement user profiles
7. Add booking cancellation
8. Multi-language support

## Support 💬

For issues or questions:
- Check Flutter documentation: https://flutter.dev/docs
- Visit Flutter community: https://flutter.dev/community

---

**Happy Coding! 🚌✨**
