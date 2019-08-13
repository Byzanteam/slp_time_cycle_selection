module SlpTimeCycleSelection
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      SlpTimeCycleSelection.webpacker
    end
  end
end
