# ArchitecturesUIKit
MVC-MVP-MVVM-C-VIP Architecture Comparison Project

In addition to this repository, there is another repository that contains the same app implemented in SwiftUI and using the Model-View-ViewModel (MVVM) architecture pattern. This repository can be found at https://github.com/frehelfer/ArchitecturesSwiftUI.

## Introduction

This project is a comparison of different software architectural patterns, specifically Model-View-Controller (MVC), Model-View-Presenter (MVP), Model-View-ViewModel-Coordinator (MVVM-C) and View-Interactor-Presenter-Entity (VIP). The project is a simple iOS app that implements a login view, a register view and a tableview that displays data fetched from an API.

The goal of this project is to demonstrate the differences and benefits of each architecture pattern and how they can be applied to an app. The project is implemented in different branches on Github, each branch representing a different architecture pattern.

## Key Features

- Login view implemented using Firebase
- Tableview that displays data fetched from an API
- UI built programmatically using UIKit

## MVC Architecture

The Model-View-Controller (MVC) architecture is one of the oldest and most widely used software architecture patterns. It provides a clear separation of concerns between the data (Model), the user interface (View), and the logic that controls the user interface (Controller).

## MVP Architecture

The Model-View-Presenter (MVP) architecture is an extension of the MVC architecture that provides a clearer separation of concerns between the data (Model), the user interface (View), and the logic that controls the user interface (Presenter). In MVP, the Presenter is responsible for handling user interactions and updating the View, while the Model remains responsible for storing and retrieving data.

## MVVM-C Architecture

The Model-View-ViewModel-Coordinator (MVVM-C) architecture is an extension of the MVVM architecture that introduces the concept of a Coordinator. The Coordinator is responsible for managing the navigation flow of the app and coordinating the interaction between the ViewModel and the View. This architecture provides a clear separation of concerns between the data (Model), the user interface (View), the logic that controls the user interface (ViewModel), and the navigation flow (Coordinator).

## VIP Architecture

The View-Interactor-Presenter-Entity (VIP) architecture is a variation of the VIPER architecture that provides a clear separation of concerns between the data (Entity), the user interface (View), the logic that controls the user interface (Presenter), and the business logic (Interactor). The VIP architecture is particularly useful for large and complex projects, as it provides a clear structure and helps to ensure that the code is clean, maintainable, and scalable.

## Conclusion

This project provides a comparison of four popular software architecture patterns and demonstrates how they can be applied to an iOS app that implements a login view and a tableview that displays data fetched from an API. By understanding the differences and benefits of each architecture pattern, you can make an informed decision about which pattern is best suited for your project.
