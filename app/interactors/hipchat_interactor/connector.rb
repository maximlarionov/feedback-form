module HipchatInteractor
  class Connector
    TOKEN = ENV["HIPCHAT_API_TOKEN"]

    include Interactor

    def call
      if client
        context.client = client
      else
        context.fail!(message: "Couldn't establish connection to HipChat servers.")
      end
    end

    private

    def client
      @_client ||= HipChat::Client.new(TOKEN, api_version: "v2", server_url: "https://fs.hipchat.com")
    end
  end
end
