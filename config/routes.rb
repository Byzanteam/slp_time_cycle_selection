SlpTimeCycleSelection::Engine.routes.draw do
  resources :projects do
    resources :periodic_module_dates, only: [:show, :update]
  end
end
