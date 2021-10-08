Rails.application.routes.draw do
  root 'statics#top'
  get :dashboard, to: 'teams#dashboard'
  get "/give_authority/:member_id/:team_id", to: "teams#give_authority", as: "give_authority"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resource :user
  
  resources :teams do
    resources :assigns, only: %w(create destroy)
    resources :agendas, shallow: true do
      resources :articles do
        resources :comments
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
