class UsersController < ApplicationController

    require_relative '../services/user_serializer.rb'

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_json
    end

    def new
        user = User.new
    end

    def create
        user = User.create(user_params)
        render json: UserSerializer.new(user).to_serialized_json
    end

    def login
        @user = User.find_by(username:params[:username])

        if @user && @user.authenticate(params[:password])
            render json: @user
        else
            render json: {error: "Incorrect username or password. Please try again."}
        end 
    end 

    def destroy
        user = User.find_by(id: params[:id])
        user.scores.destroy_all
        user.delete
        render json: UserSerializer.new(user).to_serialized_json
    end

    private 
    def user_params
        params.permit(:username, :password)
    end 

end
