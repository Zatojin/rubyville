Test::Application.routes.draw do
  root :to => 'pages#index'

  %w[about contact cv comic].each do |page|
    get page, controller: 'pages', action:page
  end

end

