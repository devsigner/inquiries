Rails.application.routes.draw do
  namespace :inquiries, :path => '' do
    get '/contact', :to => 'inquiries#new', :as => 'new_inquiry'

    resources :contact,
                :only => :create,
                :as => :inquiries,
                :controller => 'inquiries' do
      get :thank_you, :on => :collection
    end
  end
end
