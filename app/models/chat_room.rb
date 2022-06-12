class ChatRoom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  validates :topic, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true

  def as_json(options = {})
    super(options.merge({ include: [:messages] }))
  end
end
