module Scoper
  ##
  # Adds helper methods of the Scoper module to ActionController::Base
  #
  module ActionControllerExtensions

    ##
    # Returns a child object of Scoper::Base for the given +scope+ object injecting a +user+ object.
    # Invokes the +current_user+ method by default if +user+ is ommited.
    #
    # The method is also available as a helper method in your views.
    #
    # ==== Example:
    #    scoper_object(Post.all).class
    #    # => PostScoper
    #
    def scoper_object(scope, user = current_user, affiliation = current_affiliation)
      scope.scoper_class.new(user, affiliation, scope)
    end


    ##
    # Creates an authorized scope object of the given +scope+ object and invokes +resolve+ on it.
    #
    # The method is also available as a helper method in your views.
    #
    # ==== Example:
    #    resolved_scope(Post.all)
    #    # same as
    #    #   scoper_object(Post.all).resolve
    #
    def resolved_scope(scope)
      scoper_object(scope).resolve
    end
    alias_method :resolve_scope!, :resolved_scope


    def self.included(c) #:nodoc:
      c.helper_method :scoper_object
      c.helper_method :resolved_scope
      c.helper_method :resolve_scope!
    end

  end
end


ActionController::Base.send(:include, Scoper::ActionControllerExtensions)
