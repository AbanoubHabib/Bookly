# 📚 Bookly App - Flutter

A modern **Book Discovery Application** built using **Flutter**. This project demonstrates the implementation of **Clean Architecture** and professional state management to provide a seamless user experience for browsing and searching books.

The app integrates with the **Google Books API** to fetch real-time data and provides offline capabilities for favorite books.

---


## ✨ Features

- **Book Discovery:** Explore featured and newest books from Google Books.
- **Advanced Search:** Find any book by title or author.
- **Book Details:** View detailed information including descriptions, ratings, and previews.
- Robust Error Handling:** Manage API & network errors using a centralized Failure System.
- **Favorites System:** Save your favorite books for offline access using **Hive**.
- **Dynamic Theming:** Seamless transition between Dark and Light modes using **HydratedBloc**.
- **Optimized UX:** Using **Shimmer Effect** for a professional and smooth loading experience.
- **Responsive UI:** Fully polished interface that adapts to various mobile screen sizes.

---

## 🏗️ Architecture & Patterns
This project follows **Clean Architecture** principles combined with the **MVVM (Model-View-ViewModel)** pattern in the presentation layer to ensure a robust, testable, and scalable codebase.

### 📂 Structural Breakdown:
- **Presentation Layer (MVVM):** - **View:** Flutter Widgets and UI components.
    - **ViewModel:** Powered by **BLoC/Cubit** to handle business logic and UI state transitions.
- **Domain Layer:** The core of the app, containing **Entities**, **Repositories Interfaces**, and **Use Cases**.
- **Data Layer:** Implementation of repositories, **Data Sources** (Remote/Local), and **Models** (Mappers).
---

## 🛠️ Built With (Tech Stack)

| Category | Technology Used |
| :--- | :--- |
| **Language** | Dart |
| **Framework** | Flutter |
| **State Management** | Flutter BLoC / Cubit |
| **Dependency Injection** | Get_it |
| **Networking** | Dio |
| **Local Storage** | Hive (NoSQL) |
| **Navigation** | GoRouter |
| **UI Components** | Google Fonts, Font Awesome, Shimmer |

---



## 📸 Screenshots

### App Preview
<div style="display: flex; flex-wrap: wrap; justify-content: flex-start; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/f373e7c6-4e09-4cff-86ed-873cbb55715d" alt="Screenshot 1" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/35cd63d1-5c97-43a3-98bd-6ecf29b17739" alt="Screenshot 2" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/ed099009-666b-41bb-bc6a-6440b7fa98d7" alt="Screenshot 3" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/aee5614a-ab80-493f-9b3a-8bc96ce465a6" alt="Screenshot 4" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/fe385498-c77d-47ba-93be-38ae70c50a18" alt="Screenshot 5" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/637323d7-2f94-4ac0-abae-bb2c16297c65" alt="Screenshot 6" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/1c3a584b-a64e-4270-8f34-d7ea114202f5" alt="Screenshot 7" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/5a5d1ab5-fbbf-4e58-847d-a3d37c85c013" alt="Screenshot 8" style="width: 18.5%; border-radius: 8px;">
  <img src="https://github.com/user-attachments/assets/152a9ac3-6ec5-40ae-986e-3f3986934d6b" alt="Screenshot 9" style="width: 18.5%; border-radius: 8px;">
</div>



---

## 🎥 Project Demo

Watch the full walkthrough of the app and technical explanation on LinkedIn:

🔗 [Watch Demo on LinkedIn](https://www.linkedin.com/posts/abanoub-habib-flutter_flutter-dart-cleanarchitecture-activity-7440192145376051200-ax3_)

---


## 🔗 Connect with Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Abanoub%20Habib-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/abanoub-habib-81a3a9220)
[![GitHub](https://img.shields.io/badge/GitHub-Abanoub_Habib-black?style=for-the-badge&logo=github)](https://github.com/AbanoubHabib)
