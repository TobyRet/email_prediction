require 'spec_helper'
require 'lookup'
require 'target'

describe 'Lookup' do

  let(:peter) { build(:peter) }
  let(:craig) { build(:craig) }
  let(:steve) { build(:steve) }
  let(:barack) { build(:barack) }

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

  xit 'returns nil if no matching email address found' do

    expect(lookup.search).to eq(nil)

  end

end
