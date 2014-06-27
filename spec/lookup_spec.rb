require 'spec_helper'
require_relative './helpers/targets.rb'
require 'lookup'
require 'target'
require 'patterns'


describe 'Lookup' do

  build_targets

  context 'searching existing emails' do

    it 'returns existing email addresses with matching domain name' do

      lookup = Lookup.new(peter)
      expect(lookup.search).to eq({"John Ferguson" => "john.ferguson@alphasights.com",
                                   "Damon Aw" => "damon.aw@alphasights.com",
                                   "Linda Li" => "linda.li@alphasights.com"})

      lookup = Lookup.new(craig)
      expect(lookup.search).to eq("Larry Page" => "larry.p@google.com",
                                  "Sergey Brin" => "s.brin@google.com",)

      lookup = Lookup.new(steve)
      expect(lookup.search).to eq("Steve Jobs" => "s.j@apple.com")

    end

    it 'returns empty hash if no matching email address found for target' do

      lookup = Lookup.new(fake)
      expect(lookup.search.empty?).to eq(true)

    end

  end

  context 'Most likely email pattern' do

    it 'returns the most like email pattern(s)' do
      lookup = Lookup.new(peter)
      expect(lookup.retrieve_pattern).to eq([:first_name_dot_last_name])

      lookup = Lookup.new(craig)
      expect(lookup.retrieve_pattern).to eq([:first_initial_dot_last_name, :first_name_dot_last_initial])
    end
  end

  context 'format email' do

    it "creates an email address with format: first_name_dot_last_name" do

      lookup = Lookup.new(peter)
      expect(lookup.format_email).to eq("Peter.Wong@alphasights.com")

    end

    it "creates an email address with format: first_initial_dot_last_name" do

      lookup = Lookup.new(craig)
      expect(lookup.format_email).to include("C.Silverstein@google.com")

    end

    it "creates an email address with format: first_name_dot_last_initial" do

      lookup = Lookup.new(craig)
      puts lookup.retrieve_pattern
      expect(lookup.format_email).to include("Craig.S@google.com")

    end

    it "creates an email address with format: first_initial_dot_last_initial" do

      lookup = Lookup.new(steve)
      expect(lookup.format_email).to eq("S.W@apple.com")

    end

  end

end
