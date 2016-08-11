require 'overlap/version'
require 'overlap/union'
require 'overlap/segment'
require 'overlap/collection'
require 'overlap/detect'
require 'overlap/analysis'

module Overlap

  def self.find(data, options = {})
    Analysis.new(data, options)
  end
end
