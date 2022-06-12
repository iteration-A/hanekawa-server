module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private

    def user_not_found
      reject_unauthorized_connection
    end

    def find_user
      user = User.find(cookies.encrypted['_emma_session']['user_id'])

      return user if user

      reject_unauthorized_connection
    end
  end
end
