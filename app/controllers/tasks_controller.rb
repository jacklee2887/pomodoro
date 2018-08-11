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

	def update
		@task = Task.find(params[:id])
		@task.toggle(:in_progress)
		@task.save

		redirect_back fallback_location: '/'
	end	

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		redirect_back fallback_location: '/'
	end

	def complete
		@task = Task.find(params[:id])
		@task.toggle(:completion)
		@task.save

		redirect_back fallback_location: '/'
	end

	def search
		byebug
		@search_tasks = Task.whose_description_starts_with(params[:description])

		respond_to do |format|
			format.js
		end
	end

	private
	def task_params
		params.require(:task).permit(:description, :user_id)
	end
end
