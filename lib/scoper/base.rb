##
# Defines a set of classes and methods to help with authorized scoping.
#
# Scoping is implemented with the help of policy objects. To make a scoper a class should inherit from Scoper::Base and implement
# the +resolve+ method.
#
#     class ImageScoper < Scoper::Base
#       def resolve
#         if user.global_admin?
#           Image.all
#         else
#           scope.where(user_id: user.id)
#         end
#       end
#     end
#     
#     scoper = ImageScoper.new(current_user, current_affiliation, Image.all)
#     @images = scoper.resolve
#
# To make life easier the Scoper module offers ActionControllerExtensions to easily integrate scoping in your views and controllers.
#
module Scoper
  
  ##
  # Represents the base class of any scoper object.
  #
  class Base
    # returns the User object.
    attr_reader :user

    # returns the scope object.
    attr_reader :scope
    
    # returns the affiliation object
    attr_reader :affiliation
    
    
    ##
    # Create a new Scoper for the given +user+, +affiliation+ and +scope+.
    #
    def initialize(u, a, s)
      @user         = u
      @affiliation  = a
      @scope        = s
    end
    
    
    ##
    # Returns the +scope+ as it is. Must be overwritten in sub classes.
    #
    def resolve
      scope
    end
  end
  
  ##
  # Gets raised when authorization goes wrong.
  #
  class NotAuthorizedError < StandardError
    
  end
  
end