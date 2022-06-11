class User < ApplicationRecord
  has_secure_password

  FIELDS_TO_HIDE = [:password_digest].freeze

  validates :username,
            presence: true,
            length: { minimum: 3, maximum: 12 },
            format: { with: /\A[A-Z_0-9.]+\z/i },
            uniqueness: true

  validates :password_confirmation,
            presence: true

  def as_json(options = {})
    super(options.merge({ except: FIELDS_TO_HIDE }))
  end

  def self.authenticate(username, password)
    user = User.find_by(username:)

    return false unless user

    user.authenticate password
  end
end
