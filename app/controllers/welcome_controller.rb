class WelcomeController <ApplicationController
    def home
        redirect_to new_meeting_path if logged_in?
    end
end