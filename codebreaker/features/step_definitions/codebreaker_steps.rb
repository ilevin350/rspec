# --------------------------------------------------------------------
# Create a test double
# --------------------------------------------------------------------
# Note the use of the "||=" operator.  This will set the value of the
# variable on the left with the value on the right, but ONLY if the
# variable on the left does not exist (i.e., is nil).
# --------------------------------------------------------------------
class Output
  def messages
    @messages ||= []
  end
  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^I am not yet playing$/ do
  # We intentionally leave this block empty
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(output)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end
