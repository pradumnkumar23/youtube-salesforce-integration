# 🎥 YouTube Integration with Salesforce

A Salesforce Lightning Web Component (LWC) application that integrates with the YouTube Data API to allow users to search for YouTube videos directly from Salesforce and watch the selected video within the Salesforce interface.

The project demonstrates how Salesforce can consume an external REST API using Apex, securely manage API configuration, and present external data through a modern Lightning Web Component UI.

---

## 🚀 Features

* 🔎 Search YouTube videos directly from Salesforce
* 🎬 Display YouTube video search results in an interactive Lightning UI
* ▶️ Play the selected video without leaving Salesforce
* 🔗 Integrate Salesforce with the YouTube Data API using Apex callouts
* 🔐 Store API configuration securely using Salesforce configuration metadata
* ⚡ Use Lightning Web Components for a responsive user experience
* 🧩 Separate UI, server-side logic, and configuration concerns
* 📦 Built using Salesforce DX source-driven development

---

## 🏗️ Architecture

```text
                 ┌──────────────────────┐
                 │     Salesforce UI    │
                 │       LWC            │
                 └──────────┬───────────┘
                            │
                            │ Search Keyword
                            ▼
                 ┌──────────────────────┐
                 │      Apex Class      │
                 │   Server-side Logic  │
                 └──────────┬───────────┘
                            │
                            │ HTTP Callout
                            ▼
                 ┌──────────────────────┐
                 │    YouTube Data API  │
                 └──────────┬───────────┘
                            │
                            │ JSON Response
                            ▼
                 ┌──────────────────────┐
                 │      Apex Class      │
                 │ Parse API Response   │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │         LWC          │
                 │ Display Video Results│
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │    YouTube Player    │
                 │    Selected Video    │
                 └──────────────────────┘
```

---

## 🛠️ Technology Stack

| Technology               | Purpose                            |
| ------------------------ | ---------------------------------- |
| Salesforce               | Application platform               |
| Lightning Web Components | User interface                     |
| Apex                     | Server-side logic and API callouts |
| SOQL                     | Salesforce data access             |
| YouTube Data API         | External video search              |
| Named Credential         | External API endpoint management   |
| Custom Metadata          | API configuration                  |
| Salesforce CLI           | Development and deployment         |
| VS Code                  | Development environment            |
| Git & GitHub             | Version control                    |

---

## 📂 Salesforce Components

### Lightning Web Components

The application is divided into reusable LWC components responsible for:

* Searching YouTube videos
* Displaying search results
* Selecting a video
* Rendering the YouTube player
* Managing the user interaction and component state

### Apex

Apex is responsible for:

* Preparing the YouTube API request
* Performing the HTTP callout
* Handling the API response
* Parsing JSON data
* Returning video information to the LWC

### Configuration

External API configuration is separated from the application logic to avoid hardcoding configuration values directly inside Apex.

---

## 🔌 YouTube API Integration

The application uses the **YouTube Data API** to retrieve video search results.

A typical request contains parameters such as:

```text
part=snippet
type=video
maxResults=10
q=<search keyword>
```

The user's search keyword is URL encoded before being included in the request.

The API response contains video metadata such as:

* Video ID
* Title
* Description
* Thumbnail
* Channel information
* Published date

The response is then parsed in Apex and returned to the Lightning Web Component.

---

## 🔐 API Configuration

The project keeps the external API configuration outside of the core Apex logic.

### Configuration approach

1. Create the required YouTube API configuration.
2. Configure the Salesforce external endpoint.
3. Store the API configuration in Salesforce configuration metadata.
4. Reference the configuration from Apex.
5. Use the configured endpoint for the HTTP callout.

> ⚠️ Never commit an actual API key, secret, password, or authentication token to GitHub.

For local development, configure your own YouTube API credentials in your Salesforce environment.

---

## ⚙️ How It Works

### 1. User enters a search keyword

The user enters a keyword such as:

```text
Salesforce LWC
```

### 2. LWC sends the request

The Lightning Web Component invokes the Apex method with the search keyword.

### 3. Apex prepares the API request

Apex constructs the YouTube API request and performs the HTTP callout.

### 4. YouTube returns JSON

The YouTube API returns video search results.

### 5. Apex processes the response

Apex parses the response and extracts the required video information.

### 6. LWC displays the results

The LWC renders the returned videos with their thumbnails and titles.

### 7. User selects a video

When the user selects a video, the video ID is passed to the player component.

### 8. Video plays inside Salesforce

The selected YouTube video is displayed directly within the Salesforce interface.

---

## 📁 Project Structure

```text
force-app/
└── main/
    └── default/
        ├── classes/
        │   ├── Apex Classes
        │   └── Test Classes
        │
        ├── lwc/
        │   ├── youtubeSearch/
        │   └── youtubePlayer/
        │
        └── customMetadata/
            └── YouTube Configuration

config/
scripts/
manifest/
sfdx-project.json
```

---

## 💻 Setup

### Prerequisites

* Salesforce Developer Org
* Salesforce CLI
* VS Code
* Salesforce Extension Pack
* YouTube Data API access
* Git

### Clone the repository

```bash
git clone https://github.com/pradumnkumar23/youtube-salesforce-integration.git
cd youtube-salesforce-integration
```

### Authorize your Salesforce org

```bash
sf org login web
```

### Deploy the project

```bash
sf project deploy start
```

After deployment, configure the required YouTube API settings in your Salesforce org.

---

## 🧪 Testing

Apex test classes should validate:

* Successful YouTube API responses
* API error responses
* Empty search results
* Multiple search results
* Callout behavior
* Apex-to-LWC data flow

HTTP callouts should be tested using `HttpCalloutMock` rather than making real API requests from test methods.

---

## 🔒 Security Considerations

* Do not hardcode API keys in Apex.
* Do not commit secrets to GitHub.
* Keep external API configuration separate from business logic.
* Use Salesforce-supported authentication and endpoint configuration mechanisms.
* Validate and URL-encode user-provided search parameters.
* Use test mocks for external API callouts.

---

## 📸 Screenshots

*Add screenshots of the application here.*

Suggested screenshots:

1. YouTube search interface
2. Search results
3. Selected video player
4. Salesforce configuration
5. Project architecture

Example:

```text
docs/
└── images/
    ├── search-screen.png
    ├── search-results.png
    └── video-player.png
```

---

## 🔮 Future Enhancements

* Add YouTube playlist support
* Add pagination for search results
* Add video category filters
* Add search history
* Add favorites/bookmarks
* Improve error handling and user notifications
* Add loading states and skeleton UI
* Add Jest tests for LWC components
* Add automated CI/CD deployment using GitHub Actions

---

## 🎯 What This Project Demonstrates

This project demonstrates practical Salesforce development skills including:

* Lightning Web Components
* Apex development
* REST API integration
* HTTP callouts
* External API consumption
* Named Credential usage
* Custom Metadata configuration
* JSON parsing
* Component-based UI development
* Salesforce DX
* Git/GitHub version control
* Secure configuration management
* Testable integration architecture

---

## 👨‍💻 Author

**Pradumn Kumar**

Salesforce Developer

GitHub: [@pradumnkumar23](https://github.com/pradumnkumar23)

---

## 📄 License

This project is intended for learning, demonstration, and portfolio purposes.


Your DX project follows this structure:

- **`force-app/main/default/`** - Your metadata source files live in this default package directory. You can configure additional package directories in the `sfdx-project.json` file.
- **`config/`** - Scratch org definitions and project settings
- **`scripts/`** - Automation scripts for common tasks
- **`sfdx-project.json`** - Project manifest that defines package directories, namespace, API version, and other project-level settings

See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm).

## Get Started

Ready to start developing? The [Get Started with Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_get_started_dx.htm) guide walks you through your first project, from creating a scratch org to creating a simple Apex class or LWC to deploying your code to a sandbox.

## Common Salesforce CLI Commands

Here are common CLI commands that you'll use the most:

- `sf org login web`: Authorize an org
- `sf org open`: Open your org in a browser
- `sf org create scratch`: Create a scratch org
- `sf project deploy start`: Deploy metadata to your org
- `sf project retrieve start`: Retrieve metadata from your org
- `sf template generate <artifact>`: Scaffold new components, such as Apex classes and triggers, LWC components, Lightning apps, and more
- `sf apex <command>`: Run Apex tests, run anonymous Apex blocks, and view logs
- `sf data <command>`: Work with test data
- `sf alias <command>`: Manage org aliases
- `sf config <command>`: Configure CLI settings

## Use Agentforce Vibes to Build Lightning Apps

Transform your ideas into custom Lightning apps that extend CRM workflows directly in Lightning Experience. Through natural conversations with Agentforce Vibes, implement custom objects and fields, complex business logic, and dynamic UI components. See [Build a Lightning App Using Agentforce Vibes](https://developer.salesforce.com/docs/platform/einstein-for-devs/guide/lexapp-overview.html).

## Additional Resources

- [Agentforce Vibes Developer Guide](https://developer.salesforce.com/docs/platform/einstein-for-devs/guide/einstein-overview.html)
- [Salesforce CLI Installation Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/)
- [Salesforce CLI Plugin Development Guide](https://developer.salesforce.com/docs/platform/salesforce-cli-plugin/guide/conceptual-overview.html)
- [Salesforce VS Code Extensions Documentation](https://developer.salesforce.com/tools/vscode/)

