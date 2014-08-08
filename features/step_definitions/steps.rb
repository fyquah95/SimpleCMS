World(FactoryGirl::Syntax::Methods)
World(SessionsHelper)

Given(/^a user visits root path$/) do
  visit "/"
end

Given(/^(?:a user|he) visits signin path$/) do
  visit signin_path
end

Given(/^he has an account$/) do
  @user = create(:user)
end

Given(/^a signed in user$/) do
  @user = create(:user)

  original_path = current_path
  step "he visits signin path"
  step "he submits valid credentials with email"
  visit original_path if original_path
end

When(/^he submits valid credentials with email$/) do
  fill_in("Username/Email", :with => @user.email)
  fill_in("Password",       :with => @user.password)
  page.find("form").click_on("Sign In")
end

When(/^he submits valid credentials with username$/) do
  fill_in("Username/Email", :with => @user.username)
  fill_in("Password",       :with => @user.password)
  page.find("form").click_on("Sign In")
end

When(/^he submits invalid credentials$/) do
  fill_in("Username/Email", :with => "bla")
  fill_in("Password",       :with => "bla")
  page.find("form").click_on("Sign In")
end

Then(/^he should be redirected to signin path$/) do
  expect(current_path).to eq(signin_path)
end

Then(/^he should be at his profile page$/) do
  expect(current_path).to eq(user_path(@user))
end

Then(/^he should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end
