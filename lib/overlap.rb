require 'overlap/version'
require 'overlap/union'
require 'overlap/segment'
require 'overlap/collection'
require 'overlap/detect'

module Overlap

  def self.find(data, options = {})
    Detect.new(
      Collection.new(data, options).collection
    ).overlaps.map do |reference, overlaps|
      Union.new({ reference => overlaps })
    end
  end
end
