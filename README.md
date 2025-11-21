# YanaWay 🚌

YanaWay is a modern, user-friendly bus booking mobile application built with Flutter. This app allows users to easily search, book, and pay for bus tickets with a seamless and intuitive user experience.

## Features ✨

### 🎨 **Beautiful UI/UX**
- Modern and clean interface based on professional Figma designs
- Smooth animations and transitions
- Responsive design that works on all screen sizes
- Consistent color scheme and typography

### 🔐 **Login Screen**
- Elegant login interface with social authentication options
- Secure password input
- Google and Apple sign-in support (UI ready)

### 🏠 **Home Screen**
- Easy route selection (From/To locations)
- Interactive date picker
- Swap button to quickly switch origin and destination
- Beautiful calendar interface
- Quick search functionality

### 🚌 **Bus Booking**
- List of available buses with detailed information
- Real-time seat availability
- Pricing information
- Bus types (Semi Luxury, etc.)
- Departure and arrival times

### 💺 **Seat Selection**
- Interactive seat map with different states:
  - Available (Green)
  - Already Booked (Red)
  - Not Provided (Grey)
  - Booking In Progress (Orange)
- Visual legend for seat status
- Multi-seat selection support
- Real-time price calculation

### 👤 **Passenger Details**
- Contact information form
- Optional email input
- Booking summary display
- Price breakdown (ticket + service fee)
- Grand total calculation

### 💳 **Payment Screen**
- Card type selection (Visa/Mastercard)
- Secure payment form with CVV input
- Expiration date selection
- Payment confirmation

### 📱 **Navigation**
- Bottom navigation bar with Home, Wallet, and Profile sections
- Smooth screen transitions
- Intuitive back navigation
- Clear visual feedback

## Technology Stack 🛠️

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** StatefulWidget
- **UI:** Material Design 3
- **Fonts:** Google Fonts (SF Pro Display)
- **Internationalization:** intl package
- **Design:** Based on professional Figma designs

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── bus.dart             # Bus data model
├── routes/
│   └── app_routes.dart      # Route configuration
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── booking_screen.dart
│   ├── seat_selection_screen.dart
│   ├── passenger_details_screen.dart
│   └── payment_screen.dart
├── theme/
│   └── app_theme.dart       # App theme and colors
└── widgets/                 # Reusable widgets (for future use)
```

## Getting Started 🚀

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Android Studio / VS Code / IntelliJ IDEA
- iOS Simulator or Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd yanaway
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # Android
   flutter build apk
   
   # iOS
   flutter build ios
   ```

## Design Implementation 🎨

This application is built based on the provided Figma design specifications:

- **Colors:** Matching Figma color palette
- **Typography:** SF Pro Display font family
- **Layouts:** Pixel-perfect screen layouts
- **Components:** Custom widgets matching design specs
- **Animations:** Smooth transitions and interactions

## App Flow 📲

1. **Login** → User authentication
2. **Home** → Select route and date
3. **Booking** → View available buses
4. **Seat Selection** → Choose preferred seats
5. **Passenger Details** → Enter contact information
6. **Payment** → Complete booking with payment

## Key Features Implementation ✅

✅ Responsive design for all screen sizes  
✅ Material Design 3 components  
✅ Custom theme with brand colors  
✅ Form validation and input handling  
✅ Navigation with route management  
✅ Date picker integration  
✅ Interactive seat selection  
✅ Price calculation  
✅ Payment flow simulation  

## Future Enhancements 🔮

- [ ] Backend API integration
- [ ] Real-time seat availability updates
- [ ] User authentication with backend
- [ ] Payment gateway integration
- [ ] Booking history
- [ ] Push notifications
- [ ] Offline mode support
- [ ] Multiple languages support
- [ ] User profile management
- [ ] Reviews and ratings

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the MIT License.

## Acknowledgments 🙏

- Design inspiration from Figma designs
- Flutter community for excellent packages
- Google Fonts for beautiful typography

---

**YanaWay** - Find Your Seat. Begin Your Journey. 🚌✨
