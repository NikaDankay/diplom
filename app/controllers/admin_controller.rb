class AdminController < ApplicationController
  #kip_before_action :verify_authenticity_token
  def index
  end

  def login
    puts('====================================================================================')
    #puts(@_current_admin.email)
    puts('====================================================================================')

    if session[:current_admin_id].to_s != "-"
      redirect_to "/admin/dashboard"
    end
  end

  def logout
    session[:current_admin_id] = "-"
    redirect_to "/"
  end

  def studentList
    @students = User.all
  end

  def teacherList
    @teachers = Teacher.all
  end

  def registerDiploma
    if params[:savedata].to_s == "1"
      @diploma = Diploma.new()
      @diploma.name = params[:name]
      @diploma.description = ""
      @diploma.isaprooved = 1
      @diploma.studentid = 1
      @diploma.teacherid  = params[:teacherName]
      @diploma.save()
      redirect_to "/admin/registerDiploma?message=Робота зареєстрована"
    end
  end

  def approveDiplomas
    if params[:isApprove].to_s == "1"
      d = Diploma.where(:id => params[:diplomaId]).first
      d.isaprooved = "1"
      d.save
      redirect_to "/admin/approveDiplomas"
    end
    @diplomas = Diploma.all
  end


  def sendEmailTo
    teacher = Teacher.find_by_id(params[:id].to_s)
    ExampleMailer.sample_email(teacher, params[:text]).deliver
    redirect_to '/teacherlist'
  end

  def dashboard
    @user = Administrator.find_by_id(session[:current_admin_id])
    @students = User.all
    @teachers = Teacher.all
    @onlineStudents = User.where(isonline: "true")
    @onlineTeachers = Teacher.where(isonline: "true")
  end

  def registerAdministrator
    if Administrator.find_by_email(params[:emailsignup]) != nil

      redirect_to "/admin/login?message=Пошта вже зареєстрована"
      return
    end


    if params[:passwordsignup].to_s == params[:passwordsignup_confirm].to_s
      @admin = Administrator.new()
      @admin.name = params[:usernamesignup]
      @admin.password = Base64.encode64(params[:passwordsignup].to_s)
      @admin.email = params[:emailsignup]
      @admin.save()
      redirect_to '/admin/login?message=Успішна реєстрація'
    elsif
      redirect_to "/admin/login?message=Паролі не співпадають"
    end

  end


  def loginAdministrator
    puts('====================================================================================')
    puts(params[:username])
    puts('====================================================================================')
    @admin = Administrator.where(email: params[:username]).first
    if @admin != nil
      if @admin.password.to_s == Base64.encode64(params[:password].to_s)
        openSessionFor(@admin)
        flash[:notice] = "You have successfully logged out"
        redirect_to "/admin/login?message=Залогінився"
      else
        redirect_to "/admin/login?message=Не правильний пароль"
      end
    else
      redirect_to "/admin/login?message=Не занайдено в системі"
    end


  end


  def openSessionFor(admin)
    session[:current_admin_id] = admin.id
  end
end
