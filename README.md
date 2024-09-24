# ME iOS App

This project is an iOS application designed to provide mobile access to a website by using **WKWebView**. Similar to a WebView in Android, this app loads and displays a web interface inside the iOS app, without using a local database.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Features

- **WKWebView Integration**: Loads a website directly inside the app, offering a seamless web-to-mobile conversion.
- **Navigation Controls**: Allows basic navigation within the app (back, forward, reload).
- **Optimized for Mobile**: Converts the web-based content into a mobile-friendly experience.

## Technologies Used

- **Swift**: The primary language for iOS app development.
- **WKWebView**: Apple's web view component for loading web content within the app.

## Installation

To run the project locally on your iOS device or simulator:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/burakpekisik/me_ios_app.git
    ```

2. **Open the project in Xcode.**

3. **Configure the project:**
    Ensure that your **Deployment Target** is set correctly for the desired iOS version, and update the **Bundle Identifier** if necessary.

4. **Build and run:**
    Select your target device (simulator or a connected physical iPhone) and click **Run** (or press `Cmd + R`).

## Usage

Once installed, the app will automatically load the specified website into the **WKWebView**. You can interact with the website as if it were a native iOS application.

To change the website being displayed, you need to modify the URL in the **WKWebView** setup within your code.

### Example WKWebView Setup (in `ViewController.swift`):

```swift
import WebKit

class ViewController: UIViewController {
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView)
        
        let url = URL(string: "https://yourwebsite.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
