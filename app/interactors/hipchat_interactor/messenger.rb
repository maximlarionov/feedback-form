module HipchatInteractor
  class Messenger
    ROOM = "FS: Max L pdp room"

    include Interactor

    def call
      if context.client && context.name
        context.client[ROOM].send("", message)
      else
        context.fail!(message: "Couldn't send a message")
      end
    end

    private

    def message
      "Feedback from #{context.name}: <br><br>
      #{context.message}      <br><br>
      ____________________________<br>
      email: #{context.email}     <br>
      phone: #{context.phone}"
    end
  end
end
