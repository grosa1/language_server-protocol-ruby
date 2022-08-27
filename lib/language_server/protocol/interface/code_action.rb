module LanguageServer
  module Protocol
    module Interface
      #
      # A code action represents a change that can be performed in code, e.g. to fix a problem or
      # to refactor code.
      #
      # A CodeAction must set either `edit` and/or a `command`. If both are supplied, the `edit` is applied first, then the `command` is executed.
      #
      class CodeAction
        def initialize(title:, kind: nil, diagnostics: nil, is_preferred: nil, disabled: nil, edit: nil, command: nil, data: nil)
          @attributes = {}

          @attributes[:title] = title
          @attributes[:kind] = kind if kind
          @attributes[:diagnostics] = diagnostics if diagnostics
          @attributes[:isPreferred] = is_preferred if is_preferred
          @attributes[:disabled] = disabled if disabled
          @attributes[:edit] = edit if edit
          @attributes[:command] = command if command
          @attributes[:data] = data if data

          @attributes.freeze
        end

        #
        # A short, human-readable, title for this code action.
        #
        # @return [string]
        def title
          attributes.fetch(:title)
        end

        #
        # The kind of the code action.
        #
        # Used to filter code actions.
        #
        # @return [CodeActionKind | nil]
        def kind
          attributes.fetch(:kind)
        end

        #
        # The diagnostics that this code action resolves.
        #
        # @return [Diagnostic[] | nil]
        def diagnostics
          attributes.fetch(:diagnostics)
        end

        #
        # Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be targeted
        # by keybindings.
        #
        # A quick fix should be marked preferred if it properly addresses the underlying error.
        # A refactoring should be marked preferred if it is the most reasonable choice of actions to take.
        #
        # @since 3.15.0
        #
        # @return [boolean | nil]
        def is_preferred
          attributes.fetch(:isPreferred)
        end

        #
        # Marks that the code action cannot currently be applied.
        #
        # Clients should follow the following guidelines regarding disabled code actions:
        #
        #   - Disabled code actions are not shown in automatic [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
        #     code action menus.
        #
        #   - Disabled actions are shown as faded out in the code action menu when the user requests a more specific type
        #     of code action, such as refactorings.
        #
        #   - If the user has a [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
        #     that auto applies a code action and only disabled code actions are returned, the client should show the user an
        #     error message with `reason` in the editor.
        #
        # @since 3.16.0
        #
        # @return [{ reason:string } | nil]
        def disabled
          attributes.fetch(:disabled)
        end

        #
        # The workspace edit this code action performs.
        #
        # @return [WorkspaceEdit | nil]
        def edit
          attributes.fetch(:edit)
        end

        #
        # A command this code action executes. If a code action
        # provides an edit and a command, first the edit is
        # executed and then the command.
        #
        # @return [Command | nil]
        def command
          attributes.fetch(:command)
        end

        #
        # A data entry field that is preserved on a code action between
        # a `textDocument/codeAction` and a `codeAction/resolve` request.
        #
        # @since 3.16.0
        #
        # @return [LSPAny | nil]
        def data
          attributes.fetch(:data)
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
