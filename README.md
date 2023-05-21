# squirrelwheelchair

## Prerequisites

- fvm
- nvm
- Java JDK >= 11 for Firebase Local Emulator Suite

[![codecov](https://codecov.io/gh/MichinobuMaeda/squirrelwheelchair/branch/main/graph/badge.svg?token=bDlKS8yUqs)](https://codecov.io/gh/MichinobuMaeda/squirrelwheelchair)

## Getting Started

```bash
git clone git@github.com:MichinobuMaeda/squirrelwheelchair.git
fvm flutter pub get
nvm use
npm install
npm install --prefix functions
npm test
npm start
```

Firebase Emulators UI: <http://localhost:4040/>

## Create this project

<https://console.firebase.google.com/u/0/>

- Add project
    - Project name; squirrelwheelchair
    - [v] Enable Google Analytics for this project
    - Google Analytics account name: squirrelwheelchair
    - Analytics location : Japan
    - [v] Use the default settings for sharing Google Analytics data.
    - [v] I accept the Google Analytics terms
- squirrelwheelchair
    - Project overview
        - Project settings
            - Default GCP resource location: asia-northeast1 (Tokyo)
            - Public-facing name: squirrelwheelchair
            - Support email: my email address
            - Your apps: </> (Web)
                - App nickname:  Squirrel Wheelchair
                - [v] Also set up Firebase Hosting for this app.
            - Service accounts
                - Generate new private key
        - Usage and billing
            - Details & settings
                - Modify plan: Blaze (Pay as you go)
                - Budgets & alerts: ...
    - Build
        - Authentication: Get started
            - Sign-in method
                - Google: Enable
            - Templates
                - Template language: Japanese
            - Settings
                - User account linking: Link accounts that use the same email
                - Blocking functions
                    - Upgrade to Firebase Auth with Identity Platform to access this feature
                        - Upgrade
        - App Check: Get started
            - Squirrel Wheelchair: Register
        - Firestore: Go to Google Cloud Console
            - SWITCH TO NATIVE MODE
            - Create Database
                - [v] Start in production mode
            - Data
                - Start collection: service
                    - Add document: upgrade
        - Storage: Get started
            - [v] Start in production mode

Create GitHub repository `git@github.com:MichinobuMaeda/squirrelwheelchair.git` with some files.

```bash
$ nvm install v18.16.0
$ fvm install 3.10.0
$ fvm global 3.10.0
$ fvm flutter create --platforms web squirrelwheelchair
$ cd squirrelwheelchair
$ git clone git@github.com:MichinobuMaeda/squirrelwheelchair.git
$ mv squirrelwheelchair/* ./
$ mv squirrelwheelchair/.* ./
$ rm -rf squirrelwheelchair
$ git add .
$ git commit -m "created flutter project"
$ fvm use 3.10.0
$ echo 18 > .nvmrc
$ nvm use
$ npm init
$ npm install -D firebase-tools
$ npx firebase init
? Which Firebase features do you want to set up for this directory?:
Firestore, Functions, Storage

? Please select an option: Use an existing project
? Select a default Firebase project for this directory: squirrelwheelchair 
(squirrelwheelchair)
? What file should be used for Firestore Rules? firestore.rules
? What file should be used for Firestore indexes? firestore.indexes.json
? What language would you like to use to write Cloud Functions? JavaScript
? Do you want to use ESLint to catch probable bugs and enforce style? Yes
? Do you want to install dependencies with npm now? Yes
? What file should be used for Storage Rules? storage.rules

$ npx firebase init hosting
? What do you want to use as your public directory? build/web
? Configure as a single-page app (rewrite all urls to /index.html)? No
? Set up automatic builds and deploys with GitHub? Yes
✔  Wrote build/web/404.html
? File build/web/index.html already exists. Overwrite? No
? For which GitHub repository would you like to set up a GitHub workflow? (format: user/repository) MichinobuMaeda/squirrelwheelchair
? Set up the workflow to run a build script before every deploy? No
? Set up automatic deployment to your site's live channel when a PR is merged? Yes
? What is the name of the GitHub branch associated with your site's live channel? main
i  Action required: Visit this URL to revoke authorization for the Firebase CLI GitHub OAuth App:
https://github.com/settings/connections/applications/..........

$ rm build/web/404.html
$ cat squirrelwheelchair-firebase-adminsdk-zyq30-aaaaaaaaaaaaa.json | base64
```

Set BASE64 encoded service account key to GitHub Actions Secret `FIREBASE_SERVICE_ACCOUNT_BASE64`.

`.gitignore`

```gitignore
.fvm/flutter_sdk
```

`.vscode/settings.json`

```json
{
    "dart.flutterSdkPath": ".fvm/flutter_sdk",
    "search.exclude": {
      "**/.fvm": true
    },
    "files.watcherExclude": {
      "**/.fvm": true
    ]
}
```

Install flutter and firebase-tools globally.

```bash
$ fvm dart pub global activate flutterfire_cli
$ flutterfire configure
✔ Which platforms should your configuration support (use arrow keys & space to select)? · web  

$ mv lib/firebase_options.dart lib/config/
```

Uninstall globally installed flutter and/or firebase-tools if you need.

Set value of `apiKey` in `lib/config/firebase_options.dart` to GitHub Actions Secret `FIREBASE_API_KEY`.

Replace the value of `apiKey` in `lib/config/firebase_options.dart` to `for test`.

Set reCAPTCHA Site Key to value of `webRecaptchaSiteKey` in `lib/config/app_info.dart`.

```bash
$ npx firebase init emulators
? Which Firebase emulators do you want to set up? Press Space to select emulators, 
then Enter to confirm your choices. Authentication Emulator, Functions Emulator, 
Firestore Emulator, Storage Emulator
? Which port do you want to use for the auth emulator? 9099
? Which port do you want to use for the functions emulator? 5001
? Which port do you want to use for the firestore emulator? 8080
? Which port do you want to use for the hosting emulator? 5000
? Which port do you want to use for the storage emulator? 9199
? Would you like to enable the Emulator UI? Yes
? Which port do you want to use for the Emulator UI (leave empty to use any available 
port)? 4040

$ npx firebase emulators:start  --only auth,firestore,storage,functions
```

Add some data.

```bash
npx firebase emulators:export test/firebase-emulators
```

After deployment of Functions

<https://console.firebase.google.com/u/0/>

- squirrelwheelchair
    - Build
        - Firestore: Go to Google Cloud Console
            - Data
                - Start collection: accounts
                    - Add document: AUTO-ID
                        - Field: admin
                            - Type: boolean
                            - Value: true
                        - Field: email
                            - Type: string
                            - Value: admin's e-mail address
                        - Field: displayName
                            - Type: string
                            - Value: admin's display name

GitHub Repository

- Settings
    - Actions
        - General
            - Workflow permissions
                - [o] Read and write permission
