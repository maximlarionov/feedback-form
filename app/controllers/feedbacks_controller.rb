class FeedbacksController < ApplicationController
  expose(:feedback) { Feedback.new(feedback_attributes) }

  def new
  end

  def create
    DeliveryNotifications.call(feedback_attributes) if feedback.valid?
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_attributes
    params
      .fetch(:feedback, feedback_author_attributes)
      .permit(:email, :name, :message, :phone)
  end

  def feedback_author_attributes
    return {} unless current_user

    {
      email: current_user.email,
      name: current_user.full_name
    }
  end
end
