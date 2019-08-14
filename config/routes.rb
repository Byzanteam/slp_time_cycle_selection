SlpTimeCycleSelection::Engine.routes.draw do
  resources :projects do
    resources :periodic_module_dates, only: [:show, :update]
    resources :profile_dates, only: [:show, :update]
    resources :calendar, only: [] do
      collection do
        get :periodic_dates
      end
    end
  end
end
