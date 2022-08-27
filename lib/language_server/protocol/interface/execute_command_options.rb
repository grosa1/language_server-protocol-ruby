module LanguageServer
  module Protocol
    module Interface
      #
      # The server capabilities of a [ExecuteCommandRequest](#ExecuteCommandRequest).
      #
      class ExecuteCommandOptions
        def initialize(commands:, work_done_progress: nil)
          @attributes = {}

          @attributes[:commands] = commands
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # The commands to be executed on the server
        #
        # @return [string[]]
        def commands
          attributes.fetch(:commands)
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
