class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  def index
    @jobs = current_user.jobs
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
       @job = current_user.jobs.new(job_params)
    if @job.save
       redirect_to jobs_path(@job)
    else 
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else 
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end 

  private
  def set_job
    @job = current_user.jobs.find(params[:id])
  end 

  def job_params
    params.require(:job).permit(:description, :start_date, :deliver_date, :miles, :earnings)
  end 

end
