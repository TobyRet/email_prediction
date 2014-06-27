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

    expect(patterns.first_name_dot_last_name).to eq({ first_name_dot_last_name: 3 })
    expect(patterns.first_initial_dot_last_name).to eq({ first_initial_dot_last_name: 0 })
    expect(patterns.first_name_dot_last_initial).to eq({ first_name_dot_last_initial: 0 })
    expect(patterns.first_initial_dot_last_initial).to eq({ first_initial_dot_last_initial: 0 })

  end

  it "knows if an existing email matches the pattern: first_initial_dot_last_name" do

    lookup = Lookup.new(craig)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_initial_dot_last_name).to eq({ first_initial_dot_last_name: 1 })
    expect(patterns.first_initial_dot_last_initial).to eq({ first_initial_dot_last_initial: 0 })

  end

  it "knows if an existing email matches the pattern: first_name_dot_last_initial" do

    lookup = Lookup.new(craig)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_name_dot_last_initial).to eq({ first_name_dot_last_initial: 1 })
    expect(patterns.first_initial_dot_last_initial).to eq({ first_initial_dot_last_initial: 0 })

  end

  it "knows if an existing email matches the pattern: first_initial_dot_last_initial" do

    lookup = Lookup.new(steve)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.first_initial_dot_last_initial).to eq({ first_initial_dot_last_initial: 1 })

  end

  xit "return an array counting all pattern types" do

    lookup = Lookup.new(peter)
    matching_emails = lookup.search
    patterns = Patterns.new(matching_emails)

    expect(patterns.frequency).to eq([{ first_name_dot_last_name: 3 },
                                      { first_initial_dot_last_name: 0 },
                                      { first_name_dot_last_initial: 0 },
                                      { first_initial_dot_last_initial: 0 } ])

  end

end
