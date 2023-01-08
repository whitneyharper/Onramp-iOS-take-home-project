# Power Quotes 

## Table of contents

- [Overview](#overview)
  - [Description](#description)
  - [Features](#features) 
- [Architecture](#architecture)
  - [Models](#models)
  - [Views](#views)
  - [Controllers](controllers)
- [Design](#design)
  - [Models](#models)
  - [Views](#views)
  - [Controllers](controllers)
- [Author](#author)

## Overview

### Description

Power Quotes iOS application displays quotes from influential people provided by [Dummy JSON](https://dummyjson.com/) quote API.   

### Features

- Display featured products on home page.
- Administrator page for inventory management.
- Administrator authentication and authorization.
- Payment processing with Stripe.
- User can add and remove products from cart.
- User can adjust quantity.
- Order confirmation page with order number for users when payment is success.
- Checkout form validation.

### Screenshots

![](./images/framez.jpg)

![](./images/products.jpg)

![](./images/product.jpg)

![](./images/cart.jpg)

![](./images/checkout.jpg)

![](./images/payment-success.jpg)

![](./images/confirmation.jpg)

## Architecture Pattern
Power Quotes application leverages the MVC architectural pattern. I chose MVC because of the simplicity of the app, it has a small number of models and views, and there is no complex functionality. Because of those facts, the app benefited the most from using MVC over MVVM, which would have added unnecessary complexity. Some of the benefits of the approach are: 
- I make updates to view designs without affecting models or logic.
- Components can be easily tested.
- I can reuse my models and/or views in other parts of the app.
- I can add new features or screens to the app since each component can be developed and tested independently.
- My code codebase is easy to understand.

### Models
- Quote.swift
A struct represents a quote from an API. It has the following properties:

  - `id`: An integer representing the unique ID of the quote.
  - `quote`: A string containing the text of the quote.
  - `author`: A string containing the name of the author of the quote.

The `Quote` struct conforms to the `Decodable` protocol, which means it can be initialized from a JSON object. 

- Favorite.swift
A struct represents a favorite quote that a user has saved. It has the following properties:

  - `quote`: A string containing the text of the quote.
  - `author`: A string containing the name of the author of the quote.

The `Favorite` struct conforms to the `Codable` protocol, which means it can be encoded and decoded from a data object (such as JSON). T

The `Equatable` extension for `Favorite` provides a way to compare two `Favorite` objects for equality. 

### Views
- RandomQuoteView.swift
A custom UIView that defines the UI components and layout for the random quote UI.

- FavoriteQuoteView.swift
A custom UIView that defines the UI components and layout for the favorite quote UI.

- FavoriteCell.swift
A custom UITableViewCell that defines the UI components and layout a cell in the Favorites table.

### Controllers
- RandomQuoteView.swift

## UI Design

### Random Quote View
- AWS Amplify
    - AWS Cognito
    


### Favorites Table View
- Stripe


### Favorite Quote View
* [Node.js](https://nodejs.org/en/) is needed.



## Authors

- [@whitneyharper](https://github.com/whitneyharper)

