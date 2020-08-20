class ScoresController < ApplicationController
    def show
        score = Score.find_by(id: params[:id])
        render json: score
    end
    def index
        scores = Score.all
        render json: scores
    end
    def create
        score = Score.create(score_params)
        if score.valid?
            render json: score
        else
            render json: {requirePatch: true}
        end 
    end
    def update
        score = Score.find_by(id: params[:id])
        if score.update(score: params[:score])
            render json: score
        else
            render json: {error: 'Could not update'}
        end
    end
    private 
    def score_params
        params.permit(:score, :user_id, :level_id)
    end 
end