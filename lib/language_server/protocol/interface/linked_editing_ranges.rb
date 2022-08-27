module LanguageServer
  module Protocol
    module Interface
      #
      # The result of a linked editing range request.
      #
      # @since 3.16.0
      #
      class LinkedEditingRanges
        def initialize(ranges:, word_pattern: nil)
          @attributes = {}

          @attributes[:ranges] = ranges
          @attributes[:wordPattern] = word_pattern if word_pattern

          @attributes.freeze
        end

        #
        # A list of ranges that can be edited together. The ranges must have
        # identical length and contain identical text content. The ranges cannot overlap.
        #
        # @return [Range[]]
        def ranges
          attributes.fetch(:ranges)
        end

        #
        # An optional word pattern (regular expression) that describes valid contents for
        # the given ranges. If no pattern is provided, the client configuration's word
        # pattern will be used.
        #
        # @return [string | nil]
        def word_pattern
          attributes.fetch(:wordPattern)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
