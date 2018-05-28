class TeacherController < ApplicationController
  def index
  end

  def login
    puts('====================================================================================')
    #puts(@_current_admin.email)
    puts('====================================================================================')

    if session[:current_teacher_id].to_s != "-"
      redirect_to "/teacher/dashboard"
    end
  end

  def logout
    session[:current_teacher_id] = "-"
    redirect_to "/"
  end


  def dashboard
    @user = Teacher.find_by_id(session[:current_teacher_id])
    @students = User.all
    @teachers = Teacher.all
    @onlineStudents = User.where(isonline: "true")
    @onlineTeachers = Teacher.where(isonline: "true")
  end



  def registerTeacher
    if Teacher.find_by_email(params[:emailsignup]) != nil

      redirect_to "/teacher/login?message=Пошта вже зареєстрована"
      return
    end


    if params[:passwordsignup].to_s == params[:passwordsignup_confirm].to_s
      @admin = Teacher.new()
      @admin.name = params[:usernamesignup]
      @admin.password = Base64.encode64(params[:passwordsignup].to_s)
      @admin.email = params[:emailsignup]
      @admin.save()
      redirect_to '/teacher/login?message=Успішна реєстрація'
    elsif
      redirect_to "/teacher/login?message=Паролі не співпадають"
      return
    end

  end


  def loginTeacher
    @user = Teacher.where(email: params[:username]).first
    if @user != nil
      if @user.password.to_s == Base64.encode64(params[:password].to_s)
        openSessionFor(@user)
        flash[:notice] = "You have successfully logged out"
        redirect_to "/teacher/login?message=Залогінився"
      else
        redirect_to "/teacher/login?message=Не правильний пароль"
      end
    else
      redirect_to "/teacher/login?message=Не занайдено в системі"
    end


  end

  def createNew
    if params[:savedata].to_s == "1"
      @d = Document.new()
      @d.teacherId = session[:current_teacher_id]
      # @d.type = "informative"
      @d.isActive = 1
      @d.string = params[:name]
      @d.desc = params[:desc]
      @d.save
    end
  end


  def openSessionFor(teacher)
    session[:current_teacher_id] = teacher.id
  end
end
