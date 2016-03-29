require 'delocalize'

# This just reverts a delocalize patch to the Rails default.
# Necessary to prevent runtime errors due to changed method signatures.
ActiveRecord::Base.class_eval do
  define_method :_field_changed? do |attr, old_value|
    @attributes[attr].changed_from?(old_value)
  end
end

module ActiveRecord

  module Type

    class Decimal
      def type_cast_from_user(value)
        value = ::Numeric.parse_localized(value)
        type_cast(value)
      end
    end

    class Time
      def type_cast_from_user(value)
        value = ::Time.parse_localized(value) rescue value
        type_cast(value)
      end
    end

    class DateTime
      def type_cast_from_user(value)
        value = ::DateTime.parse_localized(value) rescue value
        type_cast(value)
      end
    end

    class Date
      def type_cast_from_user(value)
        value = ::Date.parse_localized(value) rescue value
        type_cast(value)
      end
    end

    module Numeric

      def non_numeric_string?(value)
        # TODO: Cache!
        value.to_s !~ /\A\d+#{Regexp.escape(I18n.t(:'number.format.separator'))}?\d*\z/
      end

    end

  end
end