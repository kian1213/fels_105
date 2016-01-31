class LessonsController < ApplicationController
  def edit
    @lesson = Lesson.find params[:id]
    @lesson_word = @lesson.lesson_words.where(answer_id: nil).first
    @word = @lesson_word.word.content
    @answers = @lesson_word.word.answers
  end

  def update
    @lesson = Lesson.find params[:id]

    params[:lesson][:lesson_words_attributes].values.each do |lesson_word|
      @answer_id = lesson_word[:answer_id]
      @lesson_word_id = lesson_word[:id]
      lesson_word[:correct] = Answer.find(@answer_id).correct
    end

    @lesson.update_attributes lesson_params

    if Answer.find(@answer_id).correct
      session[:correct] += 1
    end

    if @lesson.next_is_nil? @lesson_word_id
      @lesson.update_attributes result: session[:correct].to_s
      session.delete :correct

      redirect_to result_path @lesson
    else
      redirect_to edit_lesson_path @lesson
    end
  end

  def create
    @lesson = Lesson.create(user: current_user, category_id: params[:category_id])
    session[:correct] = 0

    redirect_to edit_lesson_path @lesson
  end

  private
  def lesson_params
    params.require(:lesson).permit :user_id, :category_id,
      lesson_words_attributes: [:id, :lesson_id, :word_id, :answer_id, :correct]
  end
end