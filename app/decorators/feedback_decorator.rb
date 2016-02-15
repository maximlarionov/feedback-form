class FeedbackDecorator < ApplicationDecorator
  delegate :user, :phone, :message

  def author
    user ? user.full_name : ""
  end

  def email
    user ? user.email : ""
  end
end
