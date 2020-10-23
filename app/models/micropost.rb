class Micropost < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user
  scope :by_created_at, ->{order(created_at: :desc)}
  validates :user_id, presence: true
  has_one_attached :image
  validates :content, presence: true,
    length: {maximum: Settings.micropost.maximum}
  validates :image,
            content_type: {in: %w([image/jpeg image/gif image/png]),
                           message: I18n.t("micropost.model.message")},
            size: {less_than: 5.megabytes,
                   message2: I18n.t("micropost.model.message2")}
  def display_image
    image.variant resize_to_limit: [Settings.user.resize_to_limit,
                                    Settings.user.resize_to_limit]
  end
end
