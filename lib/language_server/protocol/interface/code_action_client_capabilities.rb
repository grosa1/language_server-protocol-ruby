module LanguageServer
  module Protocol
    module Interface
      #
      # The Client Capabilities of a [CodeActionRequest](#CodeActionRequest).
      #
      class CodeActionClientCapabilities
        def initialize(dynamic_registration: nil, code_action_literal_support: nil, is_preferred_support: nil, disabled_support: nil, data_support: nil, resolve_support: nil, honors_change_annotations: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:codeActionLiteralSupport] = code_action_literal_support if code_action_literal_support
          @attributes[:isPreferredSupport] = is_preferred_support if is_preferred_support
          @attributes[:disabledSupport] = disabled_support if disabled_support
          @attributes[:dataSupport] = data_support if data_support
          @attributes[:resolveSupport] = resolve_support if resolve_support
          @attributes[:honorsChangeAnnotations] = honors_change_annotations if honors_change_annotations

          @attributes.freeze
        end

        #
        # Whether code action supports dynamic registration.
        #
        # @return [boolean | nil]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client support code action literals of type `CodeAction` as a valid
        # response of the `textDocument/codeAction` request. If the property is not
        # set the request can only return `Command` literals.
        #
        # @since 3.8.0
        #
        # @return [{ codeActionKind:{ valueSet:CodeActionKind[] } } | nil]
        def code_action_literal_support
          attributes.fetch(:codeActionLiteralSupport)
        end

        #
        # Whether code action supports the `isPreferred` property.
        #
        # @since 3.15.0
        #
        # @return [boolean | nil]
        def is_preferred_support
          attributes.fetch(:isPreferredSupport)
        end

        #
        # Whether code action supports the `disabled` property.
        #
        # @since 3.16.0
        #
        # @return [boolean | nil]
        def disabled_support
          attributes.fetch(:disabledSupport)
        end

        #
        # Whether code action supports the `data` property which is
        # preserved between a `textDocument/codeAction` and a
        # `codeAction/resolve` request.
        #
        # @since 3.16.0
        #
        # @return [boolean | nil]
        def data_support
          attributes.fetch(:dataSupport)
        end

        #
        # Whether the client supports resolving additional code action
        # properties via a separate `codeAction/resolve` request.
        #
        # @since 3.16.0
        #
        # @return [{ properties:string[] } | nil]
        def resolve_support
          attributes.fetch(:resolveSupport)
        end

        #
        # Whether the client honors the change annotations in
        # text edits and resource operations returned via the
        # `CodeAction#edit` property by for example presenting
        # the workspace edit in the user interface and asking
        # for confirmation.
        #
        # @since 3.16.0
        #
        # @return [boolean | nil]
        def honors_change_annotations
          attributes.fetch(:honorsChangeAnnotations)
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
