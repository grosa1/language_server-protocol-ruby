module LanguageServer
  module Protocol
    module Interface
      class LogTraceParams
        def initialize(message:, verbose: nil)
          @attributes = {}

          @attributes[:message] = message
          @attributes[:verbose] = verbose if verbose

          @attributes.freeze
        end

        # @return [string]
        def message
          attributes.fetch(:message)
        end

        # @return [string | nil]
        def verbose
          attributes.fetch(:verbose)
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
