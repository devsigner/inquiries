module Inquiries
  class InquiriesController < ::ApplicationController

    def thank_you
    end

    def new
      @inquiry = Inquiries::Inquiry.new
    end

    def create
      @inquiry = Inquiries::Inquiry.new(params[:inquiry])

      if @inquiry.save
        if @inquiry.ham?
          begin
            Inquiries::InquiryMailer.notification(@inquiry, request).deliver
          rescue
            logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
          end

          begin
            Inquiries::InquiryMailer.confirmation(@inquiry, request).deliver
          rescue
            logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
          end if Inquiries::Inquiry.send_confirmation?
        end

        redirect_to inquiries.thank_you_inquiries_inquiries_path
      else
        render :action => 'new'
      end
    end

  end
end
