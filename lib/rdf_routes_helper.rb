class ActionDispatch::Routing::Mapper
  def rdf_resources(*resources)
    resources.each do |r|
      Rails.application.routes.draw do
        # puts r
        get "#{r}/new", to: "#{r}#new", as: :"new_#{r.to_s.singularize}"
        # post "#{r}", to: "#{r}#new" #, as: :"new_#{r.to_s.singularize}"
        get "#{r}", to: "#{r}#index", as: r.to_sym
        post "#{r}", to: "#{r}#create" #, as: r.to_sym
        get "#{r}/edit/*id", to: "#{r}#edit", as: :"edit_#{r.to_s.singularize}"
        get "#{r}/*id", to: "#{r}#show", as: r.to_s.singularize.to_sym #, id: /http:\/.+/
        put "#{r}/*id", to: "#{r}#update" #, as: r.to_s.singularize.to_sym
        delete "#{r}/*id", to: "#{r}#destroy" #, as: r.to_s.singularize.to_sym
        # resources r do
        #   member do
        #     get 'new_file'
        #     post 'add_file'
        #     delete 'files' => :destroy_file
        #   end
        # end
      end
    end
  end
end