module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

      def find_verified_user
        auth_token = request.params[:token]

        if auth_token
          unless auth_token.include?(":")
            reject_unauthorized_connection
            return
          end

          user_id = auth_token.split(":").first
          user = User.find(user_id)

          if user && Devise.secure_compare(user.access_token, auth_token)
            user
          else
            reject_unauthorized_connection
            return
          end
        else
          reject_unauthorized_connection
          return
        end
      end
  end
end
