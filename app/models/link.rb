class Link < ApplicationRecord
  validates_presence_of :url
  validates_length_of :shortSlug, within: 3..255, on: :create, message: "too long"

  def short
    Rails.application.routes.url_helpers.short_url(shortSlug: self.slug)
  end
end
