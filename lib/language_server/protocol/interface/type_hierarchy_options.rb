module LanguageServer
  module Protocol
    module Interface
      #
      # Type hierarchy options used during static registration.
      #
      # @since 3.17.0
      #
      class TypeHierarchyOptions
        def initialize(work_done_progress: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        # @return [boolean | nil]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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