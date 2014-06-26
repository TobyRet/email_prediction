require 'spec_helper'
require_relative './helpers/targets.rb'
require 'lookup'
require 'target'


describe 'Lookup' do

  build_targets

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
