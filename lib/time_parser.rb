# frozen_string_literal: true

class TimeParser
  TOKENS = {
    'sec' => 1,
    'm' => 60,
    'min' => 60,
    'h' => 3600,
    'j' => 86_400

  }.freeze

  attr_reader :time

  def initialize(input)
    @input = input
    @time = 0
    parse
  end

  def parse
    return if @input.nil?

    @input.scan(/\d+|\D+/).each_slice(2).to_a.each do |amount, measure|
      @time += amount.to_i * token(measure)
    end
  end

  private

  def token(measure)
    measure.nil? ? 60 : TOKENS[measure.strip]
  end
end
