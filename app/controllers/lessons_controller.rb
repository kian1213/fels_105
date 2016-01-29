class LessonsController < ApplicationController
  def edit
    @lesson = Lesson.find params[:id]
    @lesson_word = @lesson.lesson_words.where(answer_id: nil).first
    @answers = @lesson_word.word.answers
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson_word = LessonWord.find params[:lesson_word_id]
    @lesson_word.update_attributes answer_id: params[:answer_id],
      correct: Answer.find(params[:answer_id]).correct

    if Answer.find(params[:answer_id]).correct
      session[:correct] += 1
    end

    if @lesson_word.next_is_nil? @lesson_word.id, @lesson.id
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
end