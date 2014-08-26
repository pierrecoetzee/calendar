Appearhere::Application.routes.draw do

  get "space/index"

  match 'logout' => 'login#logout', :as => 'logout_page'
  match 'login' => 'login#index', :as => 'login_page'
  match 'authenticate' => 'login#authenticate', :as => 'authenticate'

  match 'remove_appointments/space/:space_id' => 'appointment#change_current', :as =>'change_current_appointments'

  match 'get_bookings/space/:id' => 'appointment#get_bookings', defaults: {format: :json}

  resources :user do
    resources :space do
      resources :appointment
    end
  end


  root :to => 'space#index'

end
