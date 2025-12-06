# RagBot

RagBot is a Flutter chat application integrated with a FastAPI backend that leverages a custom AI assistant to answer questions based on website content. The app follows a **Melos monorepo architecture** with separate packages for `core`, `network`, and `ui`.

---

## 🗂️ Project Structure

```
repo_root/
 ├── apps/
 │    └── ragbot/       # Main Flutter app
 ├── packages/
 │    ├── core/         # Core models, logger
 │    ├── network/      # API client and networking
 │    └── ui/           # UI components, theme, widgets
 └── backend/           # FastAPI backend server
```

### Packages

* **core**: Contains `AskRequest` model and logger utilities.
* **network**: Contains `ApiClient`, endpoints, exceptions, and communicates with backend.
* **ui**: Contains reusable widgets (`CustomButton`, `MessageBubble`, `TypingIndicator`) and theme (`AppTheme`, `AppColors`, `TextStyles`).

---

## ⚡ Features

* Chat UI with message bubbles and typing indicator.
* Customizable black & white theme.
* Send questions and URLs to backend AI.
* Melos monorepo architecture for modular development.
* Logger utilities for debugging.

---

## 🚀 Getting Started

### Prerequisites

* Flutter >=3.10.3
* Dart SDK compatible with Flutter version
* Python 3.10+ (for backend)
* Melos installed globally (`dart pub global activate melos`)

### 1️⃣ Backend Setup

1. Navigate to backend folder:

```bash
cd backend
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Create a `.env` file with your Gemini API key:

```
GEMINI_API_KEY=your_api_key_here
```

4. Run the FastAPI server:

```bash
uvicorn main:app --reload
```

Server runs at `http://127.0.0.1:8000`.

> Note: For Android emulator, use `http://10.0.2.2:8000`

### 2️⃣ Flutter App Setup

1. At the root of the repo, run:

```bash
melos bootstrap
```

2. Navigate to the app:

```bash
cd apps/ragbot
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### 3️⃣ Using the App

1. Enter the **website URL** in the top input.
2. Enter your **question** in the bottom input.
3. Press **Send**.
4. Responses from the AI will appear as chat bubbles.

---

## 🛠️ Packages Used

* `dio` for HTTP requests
* `flutter` for UI
* `intl` for formatting in logger

---

## 🏗️ Melos Commands

* **Bootstrap workspace:** `melos bootstrap`
* **Run scripts across packages:** `melos run <script>`
* **List packages:** `melos list`

---

## 📌 Notes

* Ensure backend is running before sending questions.
* For local development, handle localhost URLs according to emulator/device.
* Use `Logger` from `core` for debugging network requests.

---

## 📜 License

This project is private and intended for personal/development purposes.
