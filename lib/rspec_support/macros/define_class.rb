module RspecSupport
  module Macros
    module DefineClass
      def define_class(path, base = Object, &block)
        namespace, class_name = *constant_path(path)
        klass = Class.new(base)
        namespace.const_set(class_name, klass)
        klass.class_eval(&block) if block_given?
        @defined_classes << path
        klass
      end

      def constant_path(constant_name)
        names = constant_name.split('::')
        class_name = names.pop
        namespace = names.inject(Object) { |result, name| result.const_get(name) }
        [namespace, class_name]
      end

      def initialize_defined_classes
        @defined_classes ||= []
      end

      def clear_generated_classes
        @defined_classes.reverse.each do |path|
          namespace, class_name = *constant_path(path)
          namespace.send(:remove_const, class_name)
        end

        @defined_classes.clear
      end
    end
  end
end

RSpec.configure do |config|
  config.include RspecSupport::Macros::DefineClass

  config.before do
    initialize_defined_classesj
  end

  config.after do
    clear_generated_classes
  end
end
