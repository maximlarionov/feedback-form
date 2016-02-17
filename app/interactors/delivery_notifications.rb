class DeliveryNotifications
  ROOM = "FS: Max L pdp room"

  include Interactor

  def call
    if context
      send_email
      send_hipchat
    else
      context.fail!(message: "Delivery Failed!")
    end
  end

  private

  def client
    @_client ||= HipchatClient.connect
  end

  def send_email
    ApplicationMailer.feedback(context).deliver_now!
  end

  def send_hipchat
    return false unless client || context.name

    client[ROOM].send("", message)
  end

  def message
    "Feedback from #{context.name}: <br><br>
    #{context.message}      <br><br>
    ____________________________<br>
    email: #{context.email}     <br>
    phone: #{context.phone}"
  end
end
