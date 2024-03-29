require 'webmock/rspec'
require 'json'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  include WebMock

  

  config.before(:each) do
    stub_request(:get, /www.quandl.com/).with(
        headers: {
          'Accept'=>'*/*', 'User-Agent'=>'Ruby'
        }
      ).to_return(
      status: 200, 
      headers: {},
      body: File.read('./spec/response.json')
    )
  end
end
