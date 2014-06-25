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
    expect(lookup.search).to eq("blah")

    lookup = Lookup.new(craig)
    expect(lookup.search).to eq("blah")

    lookup = Lookup.new(steve)
    expect(lookup.search).to eq("blah")

  end

  xit 'returns nil if no matching email address found' do

    expect(lookup.search).to eq(nil)

  end

end
