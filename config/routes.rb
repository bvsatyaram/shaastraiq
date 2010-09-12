ActionController::Routing::Routes.draw do |map|
  # Restful Authentication Rewrites
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.manage 'manage', :controller => 'quizzes', :action => 'manage'
  map.take 'take', :controller => 'quizzes', :action => 'take'
  map.instructions 'instructions', :controller => 'quizzes', :action => 'instructions'
#  map.take 'score', :controller => 'quizzes', :action => 'score'
  
  map.quiz '/quizzes/score', :controller => 'quizzes', :action => 'score'
  # Quiz show page should show questions listing
  map.quiz '/quizzes/:quiz_id', :controller => 'questions', :action => 'index'

  # Restful Authentication Resources
  map.resources :user_sessions
  map.resources :quizzes do |quiz|
    quiz.resources :questions
  end

  # Home Page
  map.root :controller => 'quizzes', :action => 'instructions'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
