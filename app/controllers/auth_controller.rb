class AuthController < ApplicationController
    
    def login
        user = Profile.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
             token = JWT.encode({user_id: user.id}, "mysecretcode", 'HS256')
            render json: {user: user, token: token}
        else
            errors = []
            if user.nil?
              errors.push("Email doesn`t exist. Please create an account")
            else
              errors.push("Invalid Credentials")
            end
            render json: {errors: errors}
        end
    end

    def persist
        if request.headers['Authorization']
            encoded_token = request.headers['Authorization'].split(' ')[1]
            
            puts "Helooooooooo"
            puts
            puts encoded_token
            token = JWT.decode(encoded_token, "mysecretcode")
            user_id = token[0]['user_id']
            user = Profile.find(user_id)
            render json: user
        end
    end

    private

    def login_params
        params.permit!
        obj = {email: params[:email], password: params[:password]}
        return obj
    end

end