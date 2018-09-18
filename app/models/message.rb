class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates :body, presence: true, length: {minimum: 1, maximum: 250}
  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end

def timestamp
  created_at.strftime('%H:%M:%S %d %B %Y')
end


end
