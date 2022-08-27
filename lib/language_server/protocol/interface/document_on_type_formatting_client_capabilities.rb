module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities of a [DocumentOnTypeFormattingRequest](#DocumentOnTypeFormattingRequest).
      #
      class DocumentOnTypeFormattingClientCapabilities
        def initialize(dynamic_registration: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration

          @attributes.freeze
        end

        #
        # Whether on type formatting supports dynamic registration.
        #
        # @return [boolean | nil]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
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
