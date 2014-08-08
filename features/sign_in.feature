Feature: Signin In

  Scenario: Visiting the root path
  Given a user visits root path
  Then  he should be redirected to signin path

  Scenario: Signing in with correct email/password
  Given a user visits signin path
  And   he has an account
  When  he submits valid credentials with email
  Then  he should be at his profile page

  Scenario: Signing in with correct username/password
  Given a user visits signin path
  And   he has an account
  When  he submits valid credentials with username
  Then  he should be at his profile page

  Scenario: Signing in with incorrect credentials
  Given a user visits signin path
  When  he submits invalid credentials
  Then  he should see "Wrong username/email and/or password."

  Scenario: Signed in user access the sign in page
  Given a signed in user
  And   he visits signin path
  Then  he should see "You have already signed in"
