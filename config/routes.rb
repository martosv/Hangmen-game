Rails.application.routes.draw do
 get '/' => 'hangmen#index'
 post '/hangmen/:id/letter' => 'hangmen#letter', as: 'check_letter'
 post '/hangmen/:id/word' => 'hangmen#word', as: 'check_word'
 resources :hangmen
end