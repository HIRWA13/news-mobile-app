# news_app

A modern Flutter application that provides users with the latest news headlines and detailed article views.

## Features

- Latest news headlines display
- Article preview cards with images
- Article content scraping
- Detailed article view
- Responsive design

## Technical Architecture

### Core Components

- **Flutter & Dart**: The application is built using the Flutter framework
- **BLoC Pattern**: Uses flutter_bloc for state management
- **Web Scraping**: Implements article content scraping functionality

### Key Features Implementation

#### Latest News Display
- Displays news headlines in a scrollable list
- Each news item shows:
  - Article title
  - Source name
  - Featured image
- Custom UI with circular navigation buttons

#### Article Details
- Implements article content scraping
- Loading indicator during content fetch
- Error handling for failed scraping attempts
- Detailed article view with full content

## Project Structure


```md
    lib/
    ├── features/
    │ └── news/
    │ ├── domain/
    │ │ └── news_entities/
    │ │ └── headline.dart
    │ ├── presentation/
    │ │ ├── pages/
    │ │ │ └── article_details_page.dart
    │ │ ├── state/
    │ │ │ └── headlines_cubit.dart
    │ │ └── widgets/
    │ │ └── latest_news/
    │ │ ├── latest_news.dart
    │ │ └── latest_news_widget.dart
    │ └── scrapers/
    │ └── article_scraper.dart
```


## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone the repository
```bash
    # clone the repo
```

2. Install dependencies

```bash
    flutter pub get
```


3. Run the application

```bash
    flutter run
```

### State Management
The application uses the BLoC pattern through flutter_bloc for state management:

```bash
HeadlinesCubit: Manages the state of news headlines

List<Headline>: Represents the state structure for headlines
```

Author:
[Jr HIRWA](https://github.com/HIRWA13);