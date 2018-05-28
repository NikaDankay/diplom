class ExampleMailer < ApplicationMailer
  default from: "from@cathedra.com"



  def sample_email(user, text)
    @user = user
    @text = text
    mail(to: @user.email, subject: 'Email from administrators')
  end


end
