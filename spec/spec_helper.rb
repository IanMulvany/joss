# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'capybara/rspec'

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    # GAAAAAHHHHH https://github.com/rspec/rspec-rails/issues/1076
    mocks.verify_partial_doubles = false
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Limits the available syntax to the non-monkey patched syntax that is recommended.
  # For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  #   - http://teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3#new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://api.github.com/repos/arfon/joss-reviews/issues").
             with(:body => "{\"labels\":[\"review\"],\"title\":\"Submission: arfon / fidgit\",\"body\":\"**Submitting author:** @foobar (\\u003ca href=\\\"http://orcid.org/0000-0000-0000-1234\\\"\\u003eDoe, John\\u003c/a\\u003e)\\n**Repository:** http://github.com/arfon/fidgit\\n**Archive:** http://dx.doi.org/10.0001/zenodo.12345\\n**Status badge:** ![status](\\\"http://joss.theoj.org/papers/\\u003cimg src=\\\"/images/48d24b0158528e85ac7706aecd8cddc4\\\" alt=\\\"48d24b0158528e85ac7706aecd8cddc4\\\" /\\u003e/status.svg\\\")\\n\\n## Reviewer questions\\n\\n### General checks\\n\\n- [ ] **License:** Does the repository contain a plain-text LICENSE file with the contents of an [OSI approved](https://opensource.org/licenses/alphabetical) software license?\\n- [ ] **Archive:** Does the \\u003ca href=\\\"http://dx.doi.org/10.0001/zenodo.12345\\\"\\u003esoftware archive\\u003c/a\\u003e resolve?\\n- [ ] **Functionality:** Reviewers are expected to install the software they are reviewing and to verify the core functionality of the software.\\n\\n### Documentation\\n\\n- [ ] **A statement of need:** Do the authors clearly state what problems the software is designed to solve and who the target audience is?\\n- [ ] **Installation instructions:** Is there a clearly-stated list of dependencies? Ideally these should be handled with an automated package management solution.\\n- [ ] **Example usage:** Do the authors include examples of how to use the software (ideally to solve real-world analysis problems).\\n- [ ] **API documentation:** Is the software API documented to a satisfactory level?\\n- [ ] **Automated tests:** Are there automated tests or manual steps described so that the function of the software can be verified?\\n- [ ] **Community guidelines:** Are there clear guidelines for third parties wishing to 1) Contribute to the software 2) Report issues or problems with the software 3) Seek support\\n\\n### Software paper\\n\\n- [ ] **Authors:** Does the `paper.md` file include a list of authors with their affiliations?\\n- [ ] **A statement of need:** Do the authors clearly state what problems the software is designed to solve and who the target audience is?\\n- [ ] **References:** Do all references have a DOI?\\n\"}",
                  :headers => {'Accept'=>'application/vnd.github.beta+json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Octokit Ruby Gem 2.1.1'}).
             to_return(:status => 200, :body => "", :headers => {})
  end
end
