module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      auth_token = request.params[:token]
      self.current_user = if auth_token.present?
                            find_verified_user auth_token
                          else
                            nil
                          end
    end

    private

      def find_verified_user(auth_token)
        unless auth_token.include?(":")
          reject_unauthorized_connection
        end

        user_id = auth_token.split(":").first
        user = User.find_by(id: user_id)

        if user.blank? || !Devise.secure_compare(user.access_token, auth_token)
          reject_unauthorized_connection
        end
        user
      end
  end
end
