require 'spec_helper'
require_relative './helpers/targets.rb'
require 'target'
require 'lookup'
require 'patterns'

describe 'Patterns' do

  build_targets

  it "knows if an existing email matches the pattern: first_name_dot_last_name" do

    lookup = Lookup.new(peter)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_name_dot_last_name(matching_emails)).to eq({first_name_dot_last_name: 3})

  end

  it "knows if an existing email matches the pattern: first_initial_dot_last_name" do

    lookup = Lookup.new(craig)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_initial_dot_last_name(matching_emails)).to eq({first_initial_dot_last_name: 2})

  end

  xit "knows if an existing email matches the pattern: first_name_dot_last_initial" do

    lookup = Lookup.new(peter)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_name_dot_last_initial(matching_emails)).to eq({first_name_dot_last_initial: 1})

  end

  xit "knows if an existing email matches the pattern: first_initial_dot_last_initial" do

    lookup = Lookup.new(peter)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_initial_dot_last_initial(matching_emails)).to eq({first_inital_dot_last_initial: 3})

  end

end
