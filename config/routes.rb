Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'sessions/sessions' }

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      resources :gists, only: :create
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges do
      collection do
        get :find_rule_values
      end
    end
  end

  resources :feedbacks, only: [:new, :create]
end
