Rails.application.routes.draw do
  resources :books, only: :index
  resources :finished_books
end
