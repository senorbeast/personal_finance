# personal_finance

User Sign Up, Log In 
With User Dashboard, User account details and Transactions Details 

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


#### GraphQL Schema

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
> amplify codegen models
