# Scoper

## Description
Object oriented scoping for Rails applications in the YFU ecosystem.

## Installation

    gem 'scoper', tag: 'v1.0-stable', github: 'icatcher-at/scoper'

## Authorizer Classes

Defines a set of classes and methods to help with authorized scoping.

Scoping is implemented with the help of [policy objects][1]. To make a scoper a class must inherit from `Scoper::Base` and implement the `resolve` method,
which must return an `ActiveRecord::Relation` scope.

    class ImageScoper < Scoper::Base
      # public instance methods available
      #   user          -> amounts to current_user by default
      #   affiliation   -> amountes to current_affiliation by default
      #   scope         -> amounts to injected scope object

      def resolve
        if user.global_admin?
          Image.all
        else
          scope.where(user_id: user.id)
        end
      end
    end
    
    scoper = ImageScoper.new(current_user, current_affiliation, Image.all)
    @images = scoper.resolve

## Action Controller Extensions

To make life easier the Scoper module offers `ActionControllerExtensions` to easily integrate scoping in your views and controllers.

    class PostsController < ApplicationController
    
      def index
        @posts = resolved_scope(Post.all)
      end
  
    end
    
## Generator

There's also a generator available that simplifies scoper generation.

    rails g scoper Post
    #=> app/scopers/post_scoper.rb


[1]: http://eng.joingrouper.com/blog/2014/03/20/rails-the-missing-parts-policies/