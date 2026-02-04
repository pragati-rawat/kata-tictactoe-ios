# Architecture

This repo uses Clean Architecture with MVVM in the Presentation layer.

## Layers
Presentation
- SwiftUI Views
- ViewModels
- UI models and mapping

Domain
- Entities
- Use cases
- Rules and policies
- Protocols for repositories where needed

Data
- Repository implementations
- Data sources if needed

## Principles
- Domain has no dependency on UI frameworks
- Presentation depends on Domain
- Data depends on Domain
- Dependency injection is used to wire modules

