Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  ### USERS

  get   'users/info'          => 'users#info'
  get   'users/login'         => 'users#login_form'
  post  'users/login'         => 'users#login'
  get   'users/register'      => 'users#register_form'
  post  'users/register'      => 'users#register'

  ### Product
  get   'products'            => 'products#receipts'
  get   'products/detail'     => 'products#detail'
  get   'products/newreceipts'=> 'products#newreceipt'
  get   'products/search'     => 'products#search'
  post  'products/create'     => 'products#create'

  ### Welcome
  get   'about'               => 'welcome#about'
  get   'contact'             => 'welcome#contact'
  get   'blog'                => 'welcome#blog'
  get   'blogdetail'          => 'welcome#blogdetail'
end
