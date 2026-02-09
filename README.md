## 📊 app_analytics_wrapper

app_analytics_wrapper is a lightweight Flutter analytics abstraction library that tracks user behavior inside your app such as screen views, button clicks, custom events, and errors.

It provides a centralized analytics layer so your app never depends directly on Firebase, Mixpanel, or any analytics provider.

This helps you monitor how users interact with your application and allows you to change analytics providers in the future without modifying your app code.

------------

## ✨ Feature Preview

- 🧭 Automatic screen tracking (NavigatorObserver)
- 👆 Button click tracking
- 🧩 Custom event tracking
- 🚨 Error tracking
- 🧠 Centralized analytics manager
- 🔌 Provider independent architecture
- ♻️ Clean and reusable
- 🎯 No UI dependency
- ⚡ Easy to integrate
- 🏗 Production architecture ready


--------------

## 🖼 Preview

<img width="1914" height="964" alt="Screenshot 2026-02-09 161110" src="https://github.com/user-attachments/assets/053d0737-5149-4764-aa55-29549a9250f2" />
<img width="1916" height="960" alt="Screenshot 2026-02-09 161245" src="https://github.com/user-attachments/assets/d105eded-44f1-46f0-b1d6-2a8c341f660b" />

--------------

## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  app_analytics_wrapper:
    path: ../app_analytics_wrapper
```
then run:
```
flutter pub get
```
-------------

## 🗂 File Structure
```
app_analytics_wrapper/
│
├─ lib/
│   ├─ app_analytics_wrapper.dart
│   │      # Public export file
│   │
│   └─ src/
│       ├─ analytics_manager.dart
│       │      # Main analytics controller (Singleton)
│       │
│       ├─ analytics_service.dart
│       │      # Sends events to analytics provider
│       │
│       ├─ analytics_event.dart
│       │      # Event data model
│       │
│       ├─ analytics_observer.dart
│       │      # Auto screen tracking (NavigatorObserver)
│       │
│       └─ analytics_constants.dart
│              # Predefined event/screen names
│
├─ example/
│   └─ main.dart
│        # Example usage app
│
├─ pubspec.yaml
│      # Package configuration
│
├─ README.md
│      # Documentation
│
└─ LICENSE
       # MIT license

```

------------

## 🧩 AnalyticsManager API

| Method          | Parameters                                    | Required | Description                                       |
| --------------- | --------------------------------------------- | -------- | ------------------------------------------------- |
| `trackEvent()`  | `name: String, params: Map<String, dynamic>?` | Yes      | Sends a custom analytics event with optional data |
| `trackClick()`  | `buttonName: String`                          | Yes      | Tracks button or UI interaction                   |
| `trackScreen()` | `screenName: String`                          | Yes      | Tracks a screen/page view manually                |
| `trackError()`  | `message: String`                             | Yes      | Logs application errors                           |

------------

## 🧭 AnalyticsObserver

| Property             | Type                | Required | Description                                                   |
| -------------------- | ------------------- | -------- | ------------------------------------------------------------- |
| `navigatorObservers` | `NavigatorObserver` | Yes      | Enables automatic screen tracking when added to `MaterialApp` |


------------

## 📄 AnalyticsEvent

| Property     | Type                    | Required | Description             |
| ------------ | ----------------------- | -------- | ----------------------- |
| `name`       | `String`                | Yes      | Event name              |
| `parameters` | `Map<String, dynamic>?` | No       | Extra event information |


------------

## 🚀 Usage

---
1️⃣ Import
```
import 'package:app_analytics_wrapper/app_analytics_wrapper.dart';
```
---
2️⃣ Enable Automatic Screen Tracking

Add AnalyticsObserver inside MaterialApp:
```
MaterialApp(
  navigatorObservers: [
    AnalyticsObserver(),
  ],
);
```
------
3️⃣ Track Button Click
```
final analytics = AnalyticsManager();

analytics.trackClick("login_button");
```
----------
4️⃣ Track Custom Event
```
analytics.trackEvent(
  "purchase",
  params: {
    "product_id": "123",
    "price": 499
  },
);
```
5️⃣ Track Screen Manually (Optional)
```
analytics.trackScreen("home_screen");
```
6️⃣ Track Error
```
analytics.trackError("API request failed");
```

-------------------

## 📜 MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this app_analytics_wrapper library and associated documentation files
(the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY...
```

