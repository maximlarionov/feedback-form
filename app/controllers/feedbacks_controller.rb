class FeedbacksController < ApplicationController
  expose(:feedback) { Feedback.new(feedback_attributes) }

  def new
  end

  def create
    perform_delivery if feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def perform_delivery
    ApplicationMailer.feedback(feedback).deliver_now!
    HipchatInteractor::Organizer.call(feedback_attributes)
  end

  def feedback_attributes
    params.fetch(:feedback, {}).permit(:email, :name, :message, :phone)
  end
end
