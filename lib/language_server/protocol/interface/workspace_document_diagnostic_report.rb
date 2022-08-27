module LanguageServer
  module Protocol
    module Interface
      #
      # A workspace diagnostic document report.
      #
      # @since 3.17.0
      #
      class WorkspaceDocumentDiagnosticReport
        def initialize(uri:, version:, kind:, result_id: nil, items:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:version] = version
          @attributes[:kind] = kind
          @attributes[:resultId] = result_id if result_id
          @attributes[:items] = items

          @attributes.freeze
        end

        #
        # The URI for which diagnostic information is reported.
        #
        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
        end

        #
        # The version number for which the diagnostics are reported.
        # If the document is not marked as open `null` can be provided.
        #
        # @return [integer | null]
        def version
          attributes.fetch(:version)
        end

        #
        # A full document diagnostic report.
        #
        # @return ["full"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # An optional result id. If provided it will
        # be sent on the next diagnostic request for the
        # same document.
        #
        # @return [string | nil]
        def result_id
          attributes.fetch(:resultId)
        end

        #
        # The actual items.
        #
        # @return [Diagnostic[]]
        def items
          attributes.fetch(:items)
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
