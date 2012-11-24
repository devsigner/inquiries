module Inquiries
  class InquiryMailer < ActionMailer::Base

    def confirmation(inquiry, request)
      @inquiry = inquiry
      mail :subject   => Inquiries::Inquiry.confirmation_subject,
           :to        => inquiry.email,
           :from      => "\"#{Rails.application.class.parent_name}\" <no-reply@#{request.domain}>",
           :reply_to  => Inquiries::Inquiry.notification_recipients.split(',').first
    end

    def notification(inquiry, request)
      @inquiry = inquiry
      mail :subject   => Inquiries::Inquiry.notification_subject,
           :to        => Refinery::Inquiries::Setting.notification_recipients,
           :from      => "\"#{Rails.application.class.parent_name}\" <no-reply@#{request.domain}>",
           :reply_to  => inquiry.email
    end

  end
end