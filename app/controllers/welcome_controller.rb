class WelcomeController <ApplicationController
    def home
        redirect_to new_meet_path if logged_in?
    end
end