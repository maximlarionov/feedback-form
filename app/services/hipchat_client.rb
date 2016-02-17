class HipchatClient
  TOKEN = ENV["HIPCHAT_API_TOKEN"]
  class << self
    def connect
      client || nil
    end

    private

    def client
      HipChat::Client.new(TOKEN, api_version: "v2", server_url: "https://fs.hipchat.com")
    end
  end
end
