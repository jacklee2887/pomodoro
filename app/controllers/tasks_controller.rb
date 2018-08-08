class TasksController < ApplicationController

	def create
		@new_task = Task.new(task_params)
		@new_task.save

		if @new_task.save
			redirect_back fallback_location: '/'
		else
			redirect_back fallback_location: '/'
		end
	end

	private
	def task_params
		params.require(:task).permit(:description, :user_id)
	end
end
