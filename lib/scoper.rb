require 'scoper/active_record_ext'
require 'scoper/action_controller_ext'
require 'scoper/base'

module Scoper

  ##
  # Gets raised when no respective scoper class
  # can be inferred.
  #
  class UninferrableScoperError < NameError
    def initialize(klass)
      super("Could not infer a scoper for #{klass}.")
    end
  end

end
