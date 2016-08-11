# Overlap

[![Code Climate](https://codeclimate.com/github/FinalCAD/overlap.png)](https://codeclimate.com/github/FinalCAD/overlap)

[![Dependency Status](https://gemnasium.com/FinalCAD/overlap.svg)](https://gemnasium.com/FinalCAD/overlap)

[![Build Status](https://travis-ci.org/FinalCAD/overlap.svg?branch=master)](https://travis-ci.org/FinalCAD/overlap) (Travis CI)

[![Coverage Status](https://coveralls.io/repos/FinalCAD/overlap/badge.svg?branch=master&service=github)](https://coveralls.io/github/FinalCAD/overlap?branch=master)

[![Gem Version](https://badge.fury.io/rb/overlap.svg)](http://badge.fury.io/rb/overlap)

The Overlap module provides methods to remove overlapping for linear segments, also provide some informations about them:

You can give a collection of object with a start position and end position and Overlap give you Unions, Overlap spot overlapped segments and merge them to one continuous segment, and provide to you some informations like intersection quantities, new quantity/distance of your segment

The main purpose of Overlaps -- given a set of Segment objects -- is to find all possible overlaps and merge overlapped segment to ones.

This gem is inspired by [overlaps](https://github.com/h0tl33t/overlaps) so thanks [Ryan Stenberg](https://github.com/h0tl33t)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'overlap'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install overlap

## Usage

Require the Overlap module and call #find on a collection. You can feed them two main types of input:

Array of Array objects

    input_data = [ [1,4], [2,3], [5,6] ]
    Overlaps.find(input_data)

Array of whatever object where each object is of the same class and the start and end point attribute/accessors are passed as values in an options hash to the :start and :end keys:

    DataObject = Struct.new(:start_point, :end_point)

    input_data = [ DataObject.new(1,10), DataObject.new(1,5), DataObject.new(3,6) ]
    Overlaps.find(input_data, start: :start_point, end: :end_point)

Overlaps.find returns an array of Union objects, where each Union captures the following (with example output):

  New Segment

    union.segment => Overlap::Segment#... [1, 4]
    union.segment => Overlap::Segment#... [5, 6]

  All Segments overlapped

    union.segments => [ Overlap::Segment#... [1, 4], Overlap::Segment#... [2, 3] ]
    union.segments => [ Overlap::Segment#... [5, 6] ]

  Intersections

    union.intersections => [1]
    union.intersections => []

  Quantity/Distance

    union.quantity => 3
    union.quantity => 1

  Quantity/Distance With Intersections

    union.quantity_with_intersections => 4
    union.quantity_with_intersections => 1

  Intersections Quantity/Distance

    union.intersection_quantity => 1
    union.intersection_quantity => 0

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/overlap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
