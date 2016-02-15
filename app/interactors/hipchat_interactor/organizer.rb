module HipchatInteractor
  class Organizer
    include Interactor::Organizer

    organize HipchatInteractor::Connector, HipchatInteractor::Messenger
  end
end
