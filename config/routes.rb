Rails.application.routes.draw do

  # 管理機能
  namespace :admin do
    # ADMIN　TOP
    root to: 'manage#index'

    # BOT
    resources :bot, :only => [:index, :create, :destroy]

    # HASH_TAG
    resources :hash_tags, :only => [:index, :create, :destroy]

    # TWITTER
    namespace :twitter do
      resources :tweet, :only => [:create]
      resources :follow, :only => [:create]
    end
  end

  # auth
  match '/auth/twitter/callback', to: 'admin/bot#callback', via: 'get'
end
