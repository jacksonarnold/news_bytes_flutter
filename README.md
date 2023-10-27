# news_bytes

The NewsBytes mobile application for aggregating daily news.

## Branching
- `main` - production version of the application, no direct commits to main branch, only merges from dev
- `dev` - stable development branch, used for creating new feature, bug, or developer branches and for changes in those branches to be merged back in
- `<DEV_FIRSTNAME>_dev` (developer branch) - development branches for isolating changes by dev
- `<FEATURE_NAME>_feature` (feature branch) - branch targeted to a specific feature
- `<BUG_NAME>_bug` (bug branch) - branch targeted to a specific bug

## Android Builds
- `flutter clean` - clean before running a build
- `flutter build appbundle --release` - create a new app bundle run
- Keystore Password: newsbytes
  - More details in `android/key.properties`

## Generating Model Class decoders
- Using `json_serializable` and `build_runner` packages to generate model class decoders
- All model classes must be properly annotated and include decoders to handle API responses
  - Must include `part '<CLASS_NAME>.g.dart';` import at the top of the file
  - Must include `@JsonSerializable` annotation above class definition
  - Must include `factory <CLASS_NAME>.fromJson(Map<String, dynamic> json) => _$<CLASS_NAME>FromJson(json);` decoder
  - Must include `Map<String, dynamic> toJson() => _$<CLASS_NAME>ToJson(this);` encoder
- `flutter pub run build_runner build --delete-conflicting-outputs` - generate model class decoders

## Generating Provider Classes
- To generate a new provider class, run `flutter pub run build_runner watch -d` in the terminal
- **NOTE:** I'm not sure if this is any different than just running `flutter pub run build_runner build --delete-conflicting-outputs` but I'm leaving it here just in case