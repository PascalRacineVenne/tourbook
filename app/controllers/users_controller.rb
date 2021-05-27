class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
    @skills = Skill.pluck(:name, :id)
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
    authorize @user
  end

  def user_params
    params.require(:user).permit(:full_name, :nickname, :phone,
                                 :description, :skill_ids, :avatar)
  end
end
