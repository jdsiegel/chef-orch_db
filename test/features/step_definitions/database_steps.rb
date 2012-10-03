Given /^the database is postgres$/ do
  @helper = PostgresHelper.new
end

Given /^the database is mysql$/ do
  @helper = MysqlHelper.new
end

Given /^a table exists$/ do
  @helper.create_table("players")
end

Given /^the database was dropped$/ do
  @helper.drop_table("players")
end

When /^I create a new table$/ do
  @helper.create_table("players")
end

Then /^the table should exist$/ do
  assert @helper.table_exists?("players")
end

When /^I drop the table$/ do
  @helper.drop_table("players")
end

Then /^the table should not exist$/ do
  refute @helper.table_exists?("players")
end

When /^I insert a row a table$/ do
  @helper.insert_row("players", ["1", "Pat"])
end

Then /^the row should exist in the table$/ do
  result = @helper.execute("SELECT name FROM players")
  result.must_match /Pat/
end
