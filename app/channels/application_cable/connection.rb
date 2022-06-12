module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
    end

    private

    def find_user
      header = request.headers['Authorization']
      header = header.split(' ').last if header

      payload = JsonWebToken.decode(header)
      if (user = User.find_by_id(payload['user_id']))
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
