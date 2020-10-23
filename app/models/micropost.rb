class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope ->{order(created_ad: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost.maximum}
  validates :image,
            content_type: {in: %w([image/jpeg image/gif image/png]),
                           message: I18n.t("micropost.model.message")},
            size: {less_than: 5.megabytes, message2: I18n.t("micropost.model.message2")}
  def display_image
    image.variant(resize_to_limit: Settings.user.resize_to_limit)
  end
end
