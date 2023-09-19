# news_bytes

The NewsBytes mobile application for aggregating daily news.

## Branching

-   `main` - production version of the application, no direct commits to main branch, only merges from dev
-   `dev` - stable development branch, used for creating new feature, bug, or developer branches and for changes in those branches to be merged back in
-   `<DEV_FIRSTNAME>_dev` (developer branch) - development branches for isolating changes by dev
-   `<FEATURE_NAME>_feature` (feature branch) - branch targeted to a specific feature
-   `<BUG_NAME>_bug` (bug branch) - branch targeted to a specific bug

## Android Builds

-   `flutter clean` - clean before running a build
-   `flutter build appbundle --release` - create a new app bundle run
-   Keystore Password: newsbytes
    -   More details in `android/key.properties`
