class UsersController < ApplicationController
  before_action :set_user

  def show

  end

  def edit
    @skills = Skill.all.map { |skill| [skill.name, skill.id] }
  end

  def update
    if @user.update(user_params)
      @user.job_skills.destroy_all
      params[:user][:skill_ids].each do |id|
        JobSkill.create!(user_id: @user.id, skill_id: id) unless id == ''
      end
      redirect_to user_path(@user), notice: 'updated!'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :phone, :description, :skill_ids, :avatar)
  end

  # def job_skill_params
  #   params.require(:job_skill).permit(:user_id, :skill_id)
  # end
end
