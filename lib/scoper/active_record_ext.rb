module Scoper

  ##
  # Adds helper methods of the Scoper module to ActiveRecord::Base
  #
  module ActiveRecordExtensions

    module InstanceMethods
      delegate :scoper_class, to: :class
    end

    module ClassMethods
      def scoper_class
        prefix = (respond_to?(:model_name) ? model_name : name).to_s

        scoper_name = "#{prefix}Scoper"
        scoper_name.constantize
      rescue NameError => error
        if respond_to?(:superclass) && superclass.respond_to?(:scoper_class)
          superclass.scoper_class
        else
          raise unless error.missing_name?(scoper_name)
          raise Scoper::UninferrableScoperError.new(self)
        end
      end
    end

  end
end

ActiveRecord::Base.send(:include, Scoper::ActiveRecordExtensions::InstanceMethods)
ActiveRecord::Base.send(:extend, Scoper::ActiveRecordExtensions::ClassMethods)
