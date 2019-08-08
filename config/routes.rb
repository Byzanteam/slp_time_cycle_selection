SlpTimeCycleSelection::Engine.routes.draw do
  resources :projects do
    resources :periodic_modules, only: [:index, :destroy]
  end
end
