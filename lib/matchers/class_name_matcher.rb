module Representable
  module Matchers

    class ClassNameMatcher < Struct.new(:property, :class_name)

      def matches?(subject)
        @subject = subject
        matches_class?
      end

      def description
        "only allow representable property of a specific class"
      end

      def failure_message_for_should
        "Expected #{expectation}"
      end

      def failure_message_for_should_not
        "Did not expect #{expectation}"
      end

      private

      def matches_class?
        @subject.send(:representable_attrs)[property].options[:class].to_s == class_name
      end

      def expectation
        "#{@subject.class} to be a kind of #{class_name}"
      end
    end
  end
end