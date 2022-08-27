module LanguageServer
  module Protocol
    module Interface
      #
      # Inlay hint client capabilities.
      #
      # @since 3.17.0
      #
      class InlayHintClientCapabilities
        def initialize(dynamic_registration: nil, resolve_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:resolveSupport] = resolve_support if resolve_support

          @attributes.freeze
        end

        #
        # Whether inlay hints support dynamic registration.
        #
        # @return [boolean | nil]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Indicates which properties a client can resolve lazily on an inlay
        # hint.
        #
        # @return [{ properties:string[] } | nil]
        def resolve_support
          attributes.fetch(:resolveSupport)
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
