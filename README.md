# Consumer IoT Platform

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![pub package](https://img.shields.io/pub/v/get.svg?label=get&color=blue)](https://pub.dev/packages/get)

## Folder Structure - folder by screens

The point of a structure is to make it easy to find stuff & make changes as new requirements arise. A good structure does this for both experienced and new developers. 

- `core`:

   *Contains App Services, Api Calls, Localization etc., All API, GPS data, Cache etc are fetched from here*
  - `config`-  *Contains all the configuration files for the app.*
  - `localization`- *Contains all the localization files for the app.*
  - `routes` - *Contains all the routes for the app.*
  - `controllers`- *All the gloablly used controllers for the app.*
  - `api`- *Contains all the API functions.*
  - `theme`- *Contains the global app theme data.*

- `gen`:
  *Contains Asset genrated bundle*

- `meta`:

  *Contains pages, widgets, utils etc that are common for multiple features. For example: a Custom Loading indicator, Error Pages, Get location function etc*
  - `widgets` - *Contains gloablly used widgets for the app.*
  - `utils` - *Contains gloablly used utils for the app.*
  - `models` - *Model classes for the app.*

- `screens`:

  *UI Screens having a seperate controller assigned to each of them*
  - `screen A` - *Can be any screen Ex. `home_screen`*
    - `components` - *Contains all the components for the `screen A`.*
    - `controllers` - *Contains all the controllers for the `screen A`.*
    - `views` - *Contains all the views for the `screen A`, Ex. A page is having multiple tabs*
      - `tab A` - *Can be any tab Ex. `home_tab`*
        - `components` - *Contains all the components for the `tab A`.*
        - `controllers` - *Contains all the controllers for the `tab A`.*

## Flutter App Coding Guidelines:

- Using latest stable version of Flutter `3.0.1`.
- ![image](https://user-images.githubusercontent.com/90178033/172199999-a1322107-f464-48fa-802c-2f04aa05071f.png)
- Use `lower_case_file_names.dart`.
- Minimize use of statefull widgets.
- Use `const` for all constants.
- Minimize use of `setState()`.
- Use Named Routes for all the screens.
- Use line length `120` for dart files.
- ![image](https://user-images.githubusercontent.com/90178033/172284528-a9552834-4875-487d-8483-637b376b6a2f.png)




## Used Packages:

- `get` - State Management, Localization, Theming, etc.
- `cached_network_image` - Image caching library.
- `dio` - HTTP client for Restful APIs.
- `flutter_screenutil` - Screen size utility for Responsive Design.
- `shared_preferences` - Local storage.
- `json_serializable` - Code generation for serializable classes.
- `retrofit` - Code generation for RESTful APIs.
- `syncfusion_flutter_charts` - Charting library.
- `syncfusion_flutter_core` - Core library for Data Visualization.
- `syncfusion_flutter_gauges` - Gauge library for Data Visualization.
- `flutter_svg` - SVG image loading library.
- `flutter_driver` - Flutter Driver for testing (Required for Appium).

## Testing:

We are using [Appium Flutter Driver](https://github.com/appium-userland/appium-flutter-driver) for testing

If you are unfamiliar with running Appium tests, start with [Appium Getting Starting](http://appium.io/docs/en/about-appium/getting-started/) first.

The must be compiled in `debug` or `profile` mode, because `Flutter Driver does not support running in release mode.`.


