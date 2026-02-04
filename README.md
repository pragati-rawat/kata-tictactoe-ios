# Kata TicTacToe iOS

Tic Tac Toe kata implemented in SwiftUI using MVVM and Clean Architecture.
Built using TDD with Unit Tests and UI Tests.

## Goals
- Clean Architecture separation (Presentation, Domain, Data)
- MVVM with testable ViewModels
- TDD workflow with visible commit history (Red, Green, Refactor)
- CI running tests on every pull request

## Tech
- Swift
- SwiftUI
- XCTest (Unit Tests)
- XCUITest (UI Tests)

## Project Structure (target)
- App
- Presentation
- Domain
- Data
- DI
- Resources
- Tests (Unit and UI)

## How to run
Open the Xcode project and run:
- Unit Tests: Product → Test
- UI Tests: Product → Test (UI test target)

## Commit style
We use conventional style:
- chore:
- docs:
- test:
- feat:
- refactor:

Each feature follows:
1. test: add failing tests
2. feat: implement to pass
3. refactor: cleanup
