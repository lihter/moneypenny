# Moneypenny (from 2022)

[![Swift](https://img.shields.io/badge/Language-Swift-FA7343?logo=swift\&logoColor=white\&style=flat-square)](https://swift.org/)  [![UIKit](https://img.shields.io/badge/UI-UIKit-000000?logo=apple\&logoColor=white\&style=flat-square)](https://developer.apple.com/documentation/uikit)  [![Combine](https://img.shields.io/badge/Reactive-Combine-00C6FF?style=flat-square)](https://developer.apple.com/documentation/combine)  [![Networking](https://img.shields.io/badge/Networking-URLSession-007ACC?style=flat-square)](https://developer.apple.com/documentation/foundation/urlsession)  [![Clean Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-772953?style=flat-square)](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html)  [![Coordinator](https://img.shields.io/badge/Pattern-Coordinator-4A90E2?style=flat-square)](https://khanlou.com/2015/01/coordinators-redux/)  [![SnapKit](https://img.shields.io/badge/Layout-SnapKit-4285F4?logo=square\&logoColor=white\&style=flat-square)](https://github.com/SnapKit/SnapKit)  [![Diffable DataSource](https://img.shields.io/badge/DataSource-Diffable-FF2D20?style=flat-square)](https://developer.apple.com/documentation/uikit/uitableviewdiffabledatasource)  [![SPM](https://img.shields.io/badge/Dependency-SPM-000000?logo=swift\&logoColor=white\&style=flat-square)](https://swift.org/package-manager/)  [![Compositional Layout](https://img.shields.io/badge/Layout-Compositional%20Layout-F57C00?style=flat-square)](https://developer.apple.com/documentation/uikit/uicollectionviewcompositionallayout)

> A lightweight NFT release tracker providing mint times, supply info, and deep links to community channels.

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Architecture](#architecture)
* [Tech Stack](#tech-stack)
* [Screenshots](#screenshots)

---

## Overview

Moneypenny is an early-stage NFT tracking app built in 2022. It helps collectors stay up-to-date on upcoming NFT drops by:

* Fetching release schedules and mint information
* Displaying supply, price, and mint date details
* Providing deep links to Discord and Twitter channels for each collection
* Offering a clean, responsive UI using modern iOS patterns

*Note: This app was never fully completed, left in work-in-progress state and showcases key architectural patterns rather than a production-ready product.*

---

## Features

* **Home Feed**

  * Lists featured and upcoming NFT releases with key metrics
  * Infinite scrolling via `DiffableDataSource`
* **Collection Details**

  * Shows collection artwork, mint price, total supply, and mint date
  * Quick-access buttons for Discord, Twitter, and external info
* **Search & Favorites (Planned)**

  * (WIP) Search by collection name and save favorites locally
* **Responsive UI**
* **Modular Navigation**

  * Coordinator-driven flows for clean separation

---

## Architecture

Moneypenny uses **Clean Architecture** with the **Coordinator Pattern**:

```
┌────────────────────────┐
| Presentation Layer     |
| • ViewControllers      |
| • Presenters           |
├────────────────────────┤
| Domain Layer           |
| • Use Cases            |
├────────────────────────┤
| Data Layer             |
| • Repository           |
| • DataSources          |
└────────────────────────┘
```

### Layers Detail

1. **Data Layer**

   * **DataSource**: Fetches NFT data via `URLSession` + Combine
   * **Repository**: Exposes domain APIs for fetching release lists and details

2. **Domain Layer**

   * **NFTUseCase**: Encapsulates logic for retrieving and formatting NFT data

3. **Presentation Layer**

   * **Presenters**: Transform domain models into display-ready view models
   * **ViewControllers**: UIKit screens bound to presenters

4. **Coordinator / Router**

   * Manages navigation: Home → Details → External Links

---

## Tech Stack

* **Language:** Swift
* **UI:** UIKit
* **Reactive:** Combine
* **Networking:** URLSession + Combine
* **Architecture:** Clean Architecture & Coordinator Pattern
* **Layout:** SnapKit
* **Data Source:** DiffableDataSource
* **Dependency Management:** Swift Package Manager (SPM)
* **Styling:** Custom `.ttf` fonts

---

## Screenshots

![screen-moneypenny-1](https://github.com/user-attachments/assets/9d5399d4-b4ac-42e6-83b5-17b5009fe822)
![screen-moneypenny-2](https://github.com/user-attachments/assets/99062bce-1ab4-4b68-844a-54ce87e8d137)



