class MovesController < ApplicationController
    #from tutorial
    #look at current state and call its move method
    #takes in a row and col based on button user clicked on
    def create
        @game = Game.find(params[:game_id])
        @game.move(params[:row], params[:col])

        respond_to do |format|
            format.html {
                redirect_to @game
            }
        end
    end
end
