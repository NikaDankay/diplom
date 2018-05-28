class UserController < ApplicationController
  def index
  end

  def login
    puts('====================================================================================')
    puts(session[:current_user_id].to_s)
    puts('====================================================================================')

    if session[:current_user_id].to_s != "-"
      redirect_to "/user/dashboard"
    end
  end

  def logout
    session[:current_user_id] = "-"
    puts('====================================================================================')
    puts(session[:current_user_id].to_s)
    puts('====================================================================================')
    redirect_to "/"
  end

  def registerDiploma
    if params[:savedata].to_s == "1"
      @diploma = Diploma.new()
      @diploma.name = params[:name]
      @diploma.description = ""
      @diploma.isaprooved = 0
      @diploma.studentid = session[:current_user_id]
      @diploma.teacherid  = params[:teacherName]
      @diploma.save()
      redirect_to "/user/registerDiploma?message=Робота зареєстрована"
    end
  end


  def dashboard
    @user = User.find_by_id(session[:current_user_id])
    @students = User.all
    @teachers = Teacher.all
    @onlineStudents = User.where(isonline: "true")
    @onlineTeachers = Teacher.where(isonline: "true")
  end



  def registerUser
    if User.find_by_email(params[:emailsignup]) != nil

      redirect_to "/user/login?message=Пошта вже зареєстрована"
      return
    end


    if params[:passwordsignup].to_s == params[:passwordsignup_confirm].to_s
      @admin = User.new()
      @admin.name = params[:usernamesignup]
      @admin.password = Base64.encode64(params[:passwordsignup].to_s)
      @admin.email = params[:emailsignup]
      @admin.save()
      redirect_to '/user/login?message=Успішна реєстрація'
    elsif
      redirect_to "/user/login?message=Паролі не співпадають"
    end

  end


  def loginUser
    @user = User.where(email: params[:username]).first
    if @user != nil
      if @user.password.to_s == Base64.encode64(params[:password].to_s)
        openSessionFor(@user)
        flash[:notice] = "You have successfully logged out"
        redirect_to "/user/login?message=Залогінився"
      else
        redirect_to "/user/login?message=Не правильний пароль"
      end
    else
      redirect_to "/user/login?message=Не занайдено в системі"
    end


  end

def news
@documents = Document.all
end

  def openSessionFor(user)
    session[:current_user_id] = user.id
  end
end
