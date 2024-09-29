# Training Sample Project Setup Guide

This guide will help you set up the `training_sample_project` on your local machine.

## Prerequisites

Ensure you have the following installed:

- **Ruby**: 3.3.x
- **Rails**: 7.2.x

## Getting Started

### 1. Clone the repository
### 2. Install gems
```
bundle install
```
### 2. Setup DB
```
rails db:create
```
```
rails db:migrate
```
```
rails db:seed
```
### 2. Run server
For tailwind style updates
```
bin/dev
```
For traditional server
```
rails s
```
