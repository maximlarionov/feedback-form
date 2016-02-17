class FeedbacksController < ApplicationController
  expose_decorated(:feedback) do
    Feedback.new(feedback_attributes)
  end

  def new
  end

  def create
    DeliveryNotifications.call(feedback_attributes) if feedback.valid?
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_attributes
    params
      .fetch(:feedback, {})
      .permit(:email, :name, :message, :phone, :user)
      .merge(user: current_user)
  end
end
