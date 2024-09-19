class StudentLogins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      student_login = StudentLogin.from_google(**from_google_params)
      if student_login.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect student_login, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google',
                          reason: "#{auth.info.email} is not authorized."
        redirect_to new_student_login_session_path
      end
    end
  
    protected
  
    def after_omniauth_failure_path_for(_scope)
      new_student_login_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  
    private
  
    def from_google_params
      @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end
  
    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end
  