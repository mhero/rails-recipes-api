# frozen_string_literal: true

require 'time_parser'

RSpec.describe TimeParser do
  it 'should parse a string into a time in minutes to minutes' do
    expect(TimeParser.new('1m').time).to eq(60)
    expect(TimeParser.new('10min').time).to eq(600)
    expect(TimeParser.new('10').time).to eq(600)
  end

  it 'should parse a string into a time in hours to minutes' do
    expect(TimeParser.new('1h').time).to eq(3600)
  end

  it 'should parse a string into a time in hours and minutes to minutes' do
    expect(TimeParser.new('1h3m').time).to eq(3780)
    expect(TimeParser.new('1h 4m').time).to eq(3840)
    expect(TimeParser.new('1h 4').time).to eq(3840)
  end

  it 'should parse min format to 0 minutes' do
    expect(TimeParser.new('1h25m').time).to eq(5100)
  end

  it 'should parse a nil to 0 minutes' do
    expect(TimeParser.new(nil).time).to eq(0)
  end
end
