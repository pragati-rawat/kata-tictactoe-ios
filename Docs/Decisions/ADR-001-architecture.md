# ADR 001: Clean Architecture + MVVM

## Status
Accepted

## Context
We want a kata project that shows senior engineering practices:
testability, separation of concerns, and maintainability.

## Decision
Use Clean Architecture layering (Presentation, Domain, Data) and MVVM in Presentation.

## Consequences
- Domain logic stays framework independent
- ViewModels are unit test friendly
- UI stays thin

