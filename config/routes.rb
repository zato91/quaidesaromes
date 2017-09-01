Rails.application.routes.draw do
  get 'tasting_aromas/new'

  get 'tasting_aromas/create'

  get 'tasting_aromas/edit'

  get 'tasting_aromas/update'

  get 'confirmation', to: 'pages#confirmation'

  post 'confirmation', to: 'pages#confirmation'





  resources :wines do
    post "game_pro_version" => "wines#game_pro_version"
    resources :game_users do
      resources :game_user_sessions do
        member do
          get "set_game" => "game_user_sessions#set_game"
          get "join_gu_session" => "game_user_sessions#join_gu_session"
          get "intro" => "game_user_sessions#intro"
          get "intro_recruitment" => "game_user_sessions#intro_recruitment"
          get "index" => "game_user_sessions#index"
          get "play" => "game_user_sessions#play"
          get "recruitment_play" => "game_user_sessions#recruitment_play"
          post "create_answer" => "game_user_sessions#create_answer"
          get "provisional_ranking" => "game_user_sessions#provisional_ranking"
          get "user_rating" => "game_user_sessions#user_rating"
          post "create_rating" => "game_user_sessions#create_rating"
          get "pro_suspect" => "game_user_sessions#pro_suspect"
          get "suspect_choice" => "game_user_sessions#suspect_choice"
          get "pro_suspect_choice" => "game_user_sessions#pro_suspect_choice"
          get "endgame" => "game_user_sessions#endgame"
          get  "edit_pro" => "game_user_sessions#edit_pro"
          patch "update_pro" => "game_user_sessions#update_pro"

        end
      end
    end
    resources :tastings do
      resources :tasting_aromas, only: [:new, :create, :edit, :update]
    end
  end

  resources :games, only: [:new, :create]
  resources :user_answers, only: [:create]
  get "game_in_progress" => "pages#game_in_progress"
  get "progame_in_progress" => "pages#progame_in_progress"
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
