module LanguageServer
  module Protocol
    module Interface
      #
      # The parameter of a `callHierarchy/incomingCalls` request.
      #
      # @since 3.16.0
      #
      class CallHierarchyIncomingCallsParams
        def initialize(item:, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:item] = item
          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:partialResultToken] = partial_result_token if partial_result_token

          @attributes.freeze
        end

        # @return [CallHierarchyItem]
        def item
          attributes.fetch(:item)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken | nil]
        def work_done_token
          attributes.fetch(:workDoneToken)
        end

        #
        # An optional token that a server can use to report partial results (e.g. streaming) to
        # the client.
        #
        # @return [ProgressToken | nil]
        def partial_result_token
          attributes.fetch(:partialResultToken)
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
