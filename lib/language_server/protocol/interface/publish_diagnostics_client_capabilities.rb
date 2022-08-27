module LanguageServer
  module Protocol
    module Interface
      #
      # The publish diagnostic client capabilities.
      #
      class PublishDiagnosticsClientCapabilities
        def initialize(related_information: nil, tag_support: nil, version_support: nil, code_description_support: nil, data_support: nil)
          @attributes = {}

          @attributes[:relatedInformation] = related_information if related_information
          @attributes[:tagSupport] = tag_support if tag_support
          @attributes[:versionSupport] = version_support if version_support
          @attributes[:codeDescriptionSupport] = code_description_support if code_description_support
          @attributes[:dataSupport] = data_support if data_support

          @attributes.freeze
        end

        #
        # Whether the clients accepts diagnostics with related information.
        #
        # @return [boolean | nil]
        def related_information
          attributes.fetch(:relatedInformation)
        end

        #
        # Client supports the tag property to provide meta data about a diagnostic.
        # Clients supporting tags have to handle unknown tags gracefully.
        #
        # @since 3.15.0
        #
        # @return [{ valueSet:DiagnosticTag[] } | nil]
        def tag_support
          attributes.fetch(:tagSupport)
        end

        #
        # Whether the client interprets the version property of the
        # `textDocument/publishDiagnostics` notification's parameter.
        #
        # @since 3.15.0
        #
        # @return [boolean | nil]
        def version_support
          attributes.fetch(:versionSupport)
        end

        #
        # Client supports a codeDescription property
        #
        # @since 3.16.0
        #
        # @return [boolean | nil]
        def code_description_support
          attributes.fetch(:codeDescriptionSupport)
        end

        #
        # Whether code action supports the `data` property which is
        # preserved between a `textDocument/publishDiagnostics` and
        # `textDocument/codeAction` request.
        #
        # @since 3.16.0
        #
        # @return [boolean | nil]
        def data_support
          attributes.fetch(:dataSupport)
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
