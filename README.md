# personal_finance

Features:
1. [Auth] User Sign Up, Log In with Cognito
2. [Data Fetching] With User Dashboard, User account details and Transactions Details in DynamoDB with GraphQL API

Stack:  Flutter Bloc - AWS Amplify with feature wise Clean Architecture  

#### Separation of Concerns

Features in auth, home (data-fetching), core (common) folder

- Separated Auth, and Data Fetching into auth and home folder respectively
- Separate Core folder for common functionalities.

Assumption, basic schema with GraphQL API for DynamoDB

#### Fixes Needed:

UserData is null
- [ ] Fix: Create user in dynamodb, when a user sign's up with cognito.


#### Some commands

```bash
# Auto Generate Code
dart run build_runner build --delete-conflicting-outputs

dart run build_runner watch

# Manage Dependencies
dart run dependency_validator

# Create Splash Screen
dart run flutter_native_splash:create
```

#### GraphQL Schema for Dynamo DB

```
type Transaction @model @auth(rules: [{allow: public}, {allow: owner, operations: [create, read, update]}]) {
  id: ID!
  amount: Float!
  datetime: AWSDateTime!
  otherAccount: String!
  userID: ID! @index(name: "byUser")
}

type User @model @auth(rules: [{allow: public}, {allow: owner, operations: [read, update]}]) {
  id: ID!
  email: AWSEmail!
  balance: Float!
  accountNo: String!
  Transactions: [Transaction] @hasMany(indexName: "byUser", fields: ["id"])
}
```

If schema is update, update models in code with
```amplify codegen models```


#### Folder Structure

```bash
├───lib
│   │   amplifyconfiguration.dart    
│   │   main.dart                     # Entry Point
│   │   objectbox-model.json
│   │   objectbox.g.dart
│   │
│   ├───auth                          # Features wise Clean Architecture
│   │   ├───data
│   │   │   ├───datasources
│   │   │   ├───models
│   │   │   └───repository
│   │   │
│   │   ├───domain
│   │   │   ├───entities
│   │   │   ├───repository
│   │   │   └───usecases
│   │   │
│   │   └───presentation
│   │       ├───bloc
│   │       ├───views
│   │       └───widgets
│   │
│   ├───core                           # Common 
│   │   ├───data
│   │   ├───domain
│   │   ├───presentation
│   │   │   │   app_root.dart          # App Root Widget
│   │   │
│   │   ├───setup                      # DI, Amplify Setup
│   │
│   ├───home
│   │   ├───data
│   │   ├───domain
│   │   └───presentation
│   │       │
│   │       ├───views
│   │       │       homepage.dart       # Dashboard Page
│   │
│

```