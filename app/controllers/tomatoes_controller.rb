class TomatoesController < ApplicationController

	def create
		@new_tomato = Tomato.new(user_id: params[:user_id], task_id: params[:task_id])
		@new_tomato.save

		if @new_tomato.save

			render plain: @new_tomato.id
			# render json: {"hello": "world"}
		else
			return 405
		end
	end

	def complete
		@tomato = Tomato.find(params[:id])
		@tomato.toggle(:completion)
		@tomato.save

		if @tomato.save
			return 200
		else
			return 405
		end		
	end

	private
	def tomato_params
 		params.require(:tomato).permit(:user_id, :task_id)
	end

end
