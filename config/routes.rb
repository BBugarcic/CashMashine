Rails.application.routes.draw do
  get '/withdrawal', to: 'withdrawals#show'
end
