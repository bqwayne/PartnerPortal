Rails.application.routes.draw do
  
  resources :ajax_tests
  
  resources :competencies do
    member do
      get :delete
    end
  end
  resources :partners do
     member do
       get :delete
       get :add_memberships
       get :delete_memberships
     end
  end
  resources :partner_memberships do
    member do
      get :delete
    end
  end
  resources :competency_levels do
    member do
      get :delete
    end
  end
  resources :partner_levels do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
