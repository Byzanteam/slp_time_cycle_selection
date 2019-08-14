module SlpTimeCycleSelection
  class Engine < ::Rails::Engine
    isolate_namespace SlpTimeCycleSelection

    initializer "webpacker.proxy" do |app|
      insert_middleware = begin
        SlpTimeCycleSelection.webpacker.config.dev_server.present?
      rescue
        nil
      end
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
        ssl_verify_none: true,
        webpacker: SlpTimeCycleSelection.webpacker
      )
    end
  end
end
