# frozen_string_literal: true

module Users
  module Registration
    class FormValidator
      def initialize(params)
        @params = params
      end

      def self.valid?(params:)
        new(params).valid?
      end

      def valid?
        email_is_not_in_use? &&
          do_interests_exist? &&
          do_occupations_exist? &&
          reason_exist? &&
          layout_exist? &&
          color_exist? &&
          username_is_not_in_use?
      end

      private

      attr_reader :params

      def email_is_not_in_use?
        return true unless params['step'] == '2'

        !User.exists?(email: params['email'])
      end

      def do_interests_exist?
        return true unless params['step'] == '5'

        selected = params['items'].map(&:to_i)
        Interest.where(id: selected).count == selected.count
      end

      def do_occupations_exist?
        return true unless params['step'] == '6'

        selected = params['items'].map(&:to_i)
        Occupation.where(id: selected).count == selected.count
      end

      def reason_exist?
        return true unless params['step'] == '7'

        Reason.exists?(params['items'].first)
      end

      def layout_exist?
        return true unless params['step'] == '10'

        UserPageDesign.designs.values.include?(params['layout'].to_i)
      end

      def color_exist?
        return true unless params['step'] == '10'

        UserPageDesign.colors.values.include?(params['color'].to_i)
      end

      def username_is_not_in_use?
        return true unless params['step'] == '11'

        !User.exists?(username: params['username'])
      end
    end
  end
end
