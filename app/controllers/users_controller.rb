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
        user = User.new(username: params["username"])
        if user.save
            render json: UserSerializer.new(user).to_serialized_json
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.delete
        render json: UserSerializer.new(user).to_serialized_json
    end

end
