# Consumer IoT Platform

## Folder Structure:

- Core:
  - Config (Config: App configuration).
  - Localization.
  - Routes.
  - Global controller (app_controller).
- Meta:
  - Global widgets.
  - Utils.
  - Models.
- Screens:
  - Folder per screen:
    - Local Widgets.
    - Local controllers.
    - Local views.

## Flutter App Coding Guidelines:

- Using latest stable version of Flutter `3.0.1`.
- ![image](https://user-images.githubusercontent.com/90178033/172199999-a1322107-f464-48fa-802c-2f04aa05071f.png)
- Use `lower_case_file_names.dart`.

## Used Packages:

- `cached_network_image: ^3.2.1`
- `dio: ^4.0.6`
- `flutter_screenutil: ^5.5.3+2`
- `get: ^4.6.5`
- `shared_preferences: ^2.0.15`
- `json_serializable: ^6.2.0`
- `retrofit: ^3.0.1+1`
- `syncfusion_flutter_charts: ^20.1.58+1`
- `syncfusion_flutter_core: ^20.1.58+1`
- `syncfusion_flutter_gauges: ^20.1.58`

## App Features:

- GetX for state managment, navigation(named routes), localization.
- Retrofit for API calls.
- Shared Preferences for storing data locally.
- Syncfusion for data visualization.
- Json Serializable for code generation.
- Flutter Screenutil for responsive UI.
