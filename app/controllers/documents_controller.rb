class DocumentsController < ApplicationController
  def index
      @resumes = Document.all
   end

   def new
    
   end

   def create
      @resume = Document.new(resume_params)

      if @resume.save
         redirect_to documents_new_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end

   end

   def destroy
      @resume = Document.find(params[:id])
      @resume.destroy
      redirect_to documents_new_path, notice:  "The resume #{@resume.name} has been deleted."
   end

   private
      def resume_params
      params.require(:resume).permit(:name, :attachment)
   end
end
